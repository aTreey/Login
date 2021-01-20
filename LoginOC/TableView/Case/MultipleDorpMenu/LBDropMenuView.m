
//
//  LBDropMenuView.m
//  LoginOC
//
//  Created by yhp on 2018/4/8.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LBDropMenuView.h"
#import "LBDropMenuCell.h"
#import "LBDropMenuSingleCell.h"
#import "GrowupResponse.h"
#import "UIColor+Extension.h"


@interface LBDropMenuView () <UITableViewDataSource, UITableViewDelegate>
/** 保存 选择的数据(行数) */
{
@private
    NSInteger selects[3];

}
@property (nonatomic, assign) BOOL show;   // 按钮点击后 视图显示/隐藏
@property (nonatomic, assign) CGFloat rowHeightNum; // 设置 rom 高度
/* 底层取消按钮 */
@property (nonatomic, strong) UIButton *cancelButton;
/** 表视图数组 */
@property (nonatomic, strong) NSArray *tableViewArr;
/** 表视图的 底部视图 */
@property (nonatomic, strong) UIView *tableViewUnderView;
/** 显示 TableView 数量 */
@property (nonatomic, assign) NSInteger tableCount;
/** 数据 */
@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, strong) UIView *buttonsView;

/* 记录所选的item**/
@property (nonatomic, strong) NSMutableArray *oneSelectedArray;


@end

@implementation LBDropMenuView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataArr = [NSArray array];
        self.show = NO;
        self.rowHeightNum = 40.0f;
        /** 保存 初始值为-1 */
        for (int i = 0; i < 3; i++) {
            selects[i] = -1;
        }
        
        [self addSubview:self.cancelButton];
        [self.cancelButton addSubview:self.tableViewUnderView];
    }
    return self;
}


-(void)creatDropView:(UIView *)view withShowTableNum:(NSInteger)tableNum withData:(NSArray *)arr{
    if (!self.show) {
        self.show = !self.show;
        self.tableCount = tableNum;
        self.dataArr = arr;
        for (UITableView *tableView in self.tableViewArr) {
            [tableView reloadData];
        }
        
        CGFloat x = 0.f;
        CGFloat y = view.frame.origin.y + view.frame.size.height + 64;
        CGFloat w = kWidth;
        CGFloat h = kHeight - y;
        
        self.frame = CGRectMake(x, y, w, h);
        self.cancelButton.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        self.tableViewUnderView.frame = CGRectMake(0, 0, self.frame.size.width, self.rowHeightNum * 5);

        if (!self.superview) {
            [[[UIApplication sharedApplication] keyWindow] addSubview:self];
            self.alpha = 0.0f;
            [UIView animateWithDuration:0.2f animations:^{
                self.alpha = 1.0f;
            }];
            [self loadSelects];
            [self adjustTableViews];
        }
    }else{
        [self dismiss];
    }
}


#pragma mark - 加载选中的TableView
-(void)loadSelects{
    [self.tableViewArr enumerateObjectsUsingBlock:^(UITableView *tableView, NSUInteger idx, BOOL * _Nonnull stop) {
        [tableView reloadData];
        [tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:selects[idx] inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
        
        //  !idx 循环第一次 idx == 0 不执行,
        if((selects[idx] != -1 && !tableView.superview) || !idx) {
            [self.tableViewUnderView addSubview:tableView];
            [UIView animateWithDuration:0.2f animations:^{
                if (self.arrowView) {
                    self.arrowView.transform = CGAffineTransformMakeRotation(M_PI);
                }
            }];
        }
    }];
    
}

#pragma mark - 重置TableView的 位置
-(void)adjustTableViews{    
    int addTableCount = 0;
    for (UITableView *tableView in self.tableViewArr) {
        if (tableView.superview) {
            addTableCount++;
        }
    }
    
    for (int i = 0; i < addTableCount; i++) {
        UITableView *tableView = self.tableViewArr[i];
        CGRect adjustFrame = tableView.frame;
        adjustFrame.size.width = kWidth / addTableCount ;
        adjustFrame.origin.x = adjustFrame.size.width * i;
        adjustFrame.size.height = self.tableViewUnderView.frame.size.height;
        tableView.frame = adjustFrame;
        if (0 == i) {
            tableView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        } else {
            tableView.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
        }
    }
}


#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger __block count;
    [self.tableViewArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == tableView) {
            NSInteger firstSelectRow = ((UITableView *)self.tableViewArr[0]).indexPathForSelectedRow.row ;
            NSInteger secondSelectRow = ((UITableView *)self.tableViewArr[1]).indexPathForSelectedRow.row ;
            count = [self countForChooseTable:idx firstTableSelectRow:firstSelectRow withSecondTableSelectRow:secondSelectRow];
        }
    }];
    return count;
}


-(NSInteger)countForChooseTable:(NSInteger)idx firstTableSelectRow:(NSInteger)firstSelectRow withSecondTableSelectRow:(NSInteger)secondSelectRow{
    if (idx == 0) {
        return self.dataArr.count;
    }else  if (idx == 1){
        if (firstSelectRow == -1) {
            return 0;
        }else{
            return self.dataArr.count == 0 ? 0 : [[self.dataArr[firstSelectRow] childs] count];
        }
        
    }else{
        if (secondSelectRow == -1) {
            return 0;
        }else{
            return self.dataArr.count == 0 ? 0 : [self.dataArr[firstSelectRow] childs].count;
        }
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (0) {
        LBDropMenuSingleCell *cell = [tableView dequeueReusableCellWithIdentifier:DropMenuSingleCell];
        if (self.tableCount == 1) {
            cell.title = [(CourseFilterResponse *)self.dataArr[indexPath.row] data].name;
        }
        else if (self.tableCount == 2){
            NSInteger firstSelectRow = ((UITableView *)self.tableViewArr[0]).indexPathForSelectedRow.row;
            
            if (tableView == self.tableViewArr[0]) {
                cell.title = [(CourseFilterResponse *)self.dataArr[indexPath.row] data].name;
            }else if (tableView == self.tableViewArr[1]){
                CourseFilterResponse *model = [(CourseFilterResponse *)self.dataArr[firstSelectRow] childs][indexPath.row];
                cell.title = model.data.name;
            }
            
        }
        else if (self.tableCount == 3){
            NSInteger firstSelectRow = ((UITableView *)self.tableViewArr[0]).indexPathForSelectedRow.row;
            NSInteger secondSelectRow = ((UITableView *)self.tableViewArr[1]).indexPathForSelectedRow.row;
            
            if (tableView == self.tableViewArr[0]) {
                cell.title = [(CourseFilterResponse *)self.dataArr[indexPath.row] data].name;

            }else if (tableView == self.tableViewArr[1]){
                NSArray<CourseFilterResponse *> *tempArray = [(CourseFilterResponse *)self.dataArr[firstSelectRow] childs];
                cell.title = [tempArray[indexPath.row] data].name;
            }else if (tableView == self.tableViewArr[2]){
                
                CourseFilterResponse *model = [[(CourseFilterResponse *)self.dataArr[firstSelectRow] childs][secondSelectRow] childs][indexPath.row];
                cell.title = model.data.name;
            }
        }
        return cell;
        
    } else {

        LBDropMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:DropMenuCell];
        
        
        if (self.tableCount == 1) {
            CourseJsonTreeDataResponse *data =  [(CourseFilterResponse *)self.dataArr[indexPath.row] data];
            
            cell.buttonClickBlock = ^(BOOL isSelected) {
                data.isSelect = isSelected;
                [self updateSelectedItem:data tableNumber:self.tableCount];
            };
            
            cell.data = data;
        }
        else if (self.tableCount == 2){
            NSInteger firstSelectRow = ((UITableView *)self.tableViewArr[0]).indexPathForSelectedRow.row;
            
            if (tableView == self.tableViewArr[0]) {
                cell.data = [(CourseFilterResponse *)self.dataArr[indexPath.row] data];
            }else if (tableView == self.tableViewArr[1]){
                CourseFilterResponse *model = [(CourseFilterResponse *)self.dataArr[firstSelectRow] childs][indexPath.row];
                cell.data = model.data;
            }
            
        }
        else if (self.tableCount == 3){
            NSInteger firstSelectRow = ((UITableView *)self.tableViewArr[0]).indexPathForSelectedRow.row;
            NSInteger secondSelectRow = ((UITableView *)self.tableViewArr[1]).indexPathForSelectedRow.row;
            
            if (tableView == self.tableViewArr[0]) {
                cell.data = [(CourseFilterResponse *)self.dataArr[indexPath.row] data];
                
            }else if (tableView == self.tableViewArr[1]){
                NSArray<CourseFilterResponse *> *tempArray = [(CourseFilterResponse *)self.dataArr[firstSelectRow] childs];
                cell.data = [tempArray[indexPath.row] data];
            }else if (tableView == self.tableViewArr[2]){
                
                CourseFilterResponse *model = [[(CourseFilterResponse *)self.dataArr[firstSelectRow] childs][secondSelectRow] childs][indexPath.row];
                cell.data = model.data;
            }
        }
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tableCount == 1 || tableView == self.tableViewArr[0]) {
        cell.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
    } else {
        cell.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableView *secondTableView = self.tableViewArr[1];
    UITableView *thirdTableView = self.tableViewArr[2];
    
    if (self.tableCount == 1) {
        CourseFilterResponse *model = self.dataArr[indexPath.row];
        [self saveSelects];
        [self updateSelectedItem:model.data tableNumber:self.tableCount];
        [self dismiss];
        [_delegate dropMenuView:self didSelectItem:model.data];
    }
    else if (self.tableCount == 2){
        
        if (tableView == self.tableViewArr[0]) {
            if (!secondTableView.superview) {
                [self.tableViewUnderView addSubview:secondTableView];
            }
            [secondTableView reloadData];
            [self adjustTableViews];
            
        }
        else if (tableView == self.tableViewArr[1]){
            
            [self saveSelects];
            [self dismiss];
            
            NSInteger firstSelectRow = ((UITableView *)self.tableViewArr[0]).indexPathForSelectedRow.row;
            
            CourseFilterResponse *model = [(CourseFilterResponse *)self.dataArr[firstSelectRow] childs][indexPath.row];
            [_delegate dropMenuView:self didSelectItem:model.data];
        }
        
    }
    else if (self.tableCount == 3){
        
        NSInteger firstSelectRow = ((UITableView *)self.tableViewArr[0]).indexPathForSelectedRow.row;
        NSInteger secondSelectRow = ((UITableView *)self.tableViewArr[1]).indexPathForSelectedRow.row;
        
        if (tableView == self.tableViewArr[0]) {
            if (!secondTableView.superview) {
                [self.tableViewUnderView addSubview:secondTableView];
            }
            [self adjustTableViews];
            [secondTableView reloadData];
            [thirdTableView reloadData];
            
        }
        else if (tableView == self.tableViewArr[1]){
            if (!thirdTableView.superview) {
                [self.tableViewUnderView addSubview:thirdTableView];
            }
            [self adjustTableViews];
            [thirdTableView reloadData];
            
        }
        else if (tableView == self.tableViewArr[2]){
            [self saveSelects];
            [self dismiss];
            
            CourseFilterResponse *model = [[(CourseFilterResponse *)self.dataArr[firstSelectRow] childs][secondSelectRow] childs][indexPath.row];
            [_delegate dropMenuView:self didSelectItem:model.data];
        }
    }
    
}


- (void)updateSelectedItem:(CourseJsonTreeDataResponse *)model tableNumber:(NSInteger)tableNumber {
    model.isSelect = !model.isSelect;
    if (model.isSelect) {
        [self.selectedArray addObject:model];
    } else {
        [self.selectedArray removeObject:model];
    }
    
    [self.tableViewArr[tableNumber] reloadData];
}


- (void)bottomButtonAction:(UIButton *)sender {
    NSLog(@"bottomButtonClick");
    if (sender.tag == 2000) {
        // 重置
    } else {
        // 确定
        [self dismiss];
        if ([self.delegate respondsToSelector:@selector(dropMenuView:confirmButton:)]) {
            [self.delegate dropMenuView:self confirmButton:sender];
        }
    }
}



#pragma mark - 记录 选择状态
-(void)saveSelects{
    [self.tableViewArr enumerateObjectsUsingBlock:^(UITableView *tableView, NSUInteger idx, BOOL * _Nonnull stop) {
        selects[idx] = tableView.superview ? tableView.indexPathForSelectedRow.row : -1;
    }];
}



#pragma mark - 视图消失
- (void)dismiss{
    if(self.superview) {
        self.show = !self.show;
        [self endEditing:YES];
        self.alpha = .0f;
        [self.tableViewUnderView.subviews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
            [obj removeFromSuperview];
        }];
        
        [self removeFromSuperview];
        [UIView animateWithDuration:0.25 animations:^{
            if (self.arrowView) {
                self.arrowView.transform = CGAffineTransformMakeRotation(0);
            }
        }];
        
    }
}

-(void)cancelButtonAction:(UIButton *)button{
    [self dismiss];
}

-(NSArray *)tableViewArr{
    if (_tableViewArr == nil) {
        _tableViewArr = @[[[UITableView alloc] init], [[UITableView alloc] init], [[UITableView alloc] init]];
        [_tableViewArr enumerateObjectsUsingBlock:^(UITableView *tableView, NSUInteger idx, BOOL * _Nonnull stop) {
            [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"dropCell"];
            [tableView registerClass:[LBDropMenuSingleCell class] forCellReuseIdentifier:DropMenuSingleCell];
            [tableView registerClass:[LBDropMenuCell class] forCellReuseIdentifier:DropMenuCell];
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView.frame = CGRectZero;
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView.tableFooterView = [[UIView alloc] init];
            tableView.showsVerticalScrollIndicator = NO;
            tableView.rowHeight = self.rowHeightNum;
//            tableView.allowsMultipleSelection = YES;
        }];
    }
    return _tableViewArr;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [_cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (UIView *)tableViewUnderView {
    if (!_tableViewUnderView) {
        _tableViewUnderView = [[UIView alloc] init];
        _tableViewUnderView.backgroundColor = [UIColor whiteColor];
    }
    return _tableViewUnderView;
}

- (NSMutableArray *)selectedArray {
    if (!_oneSelectedArray) {
        _oneSelectedArray = [NSMutableArray array];
    }
    return _oneSelectedArray;
}

- (void)setupButtonsView {
    self.buttonsView = [[UIView alloc] init];
    [self.tableViewUnderView addSubview:self.buttonsView];
    NSArray *titles = @[@"重置", @"确定"];
    NSArray *titlesColor = @[[UIColor blackColor], [UIColor whiteColor]];
    NSArray *backgroundColors = @[[UIColor whiteColor], [UIColor orangeColor]];
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 * i, 0, [UIScreen mainScreen].bounds.size.width / 2, 60);
        button.backgroundColor = backgroundColors[i];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.tag = 2000 + i;
        [button setTitleColor:titlesColor[i] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(bottomButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonsView addSubview:button];
    }
}

@end
