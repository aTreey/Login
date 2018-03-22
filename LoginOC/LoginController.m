//
//  LoginController.m
//  LoginOC
//
//  Created by liepin on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LoginController.h"
#import "LoginItem.h"
#import "AccountFieldCell.h"
#import "AccoutCellModel.h"

@interface LoginController () <UITableViewDataSource>



@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self setupTableViewConstraint];
    
    // 初始化数据
    [self initData];
}


- (void)initData {
    
    AccoutCellModel *cellModel1 = [[AccoutCellModel alloc] initWithTips:@"账号" placeholder:@"请输入您的账户"];
    AccoutCellModel *cellModel2 = [[AccoutCellModel alloc] initWithTips:@"密码" placeholder:@"请输入您的密码"];
    AccoutCellModel *cellModel3 = [[AccoutCellModel alloc] initWithTips:@"" placeholder:@"登陆按钮"];
    
    LoginItem *item1 = [[LoginItem alloc] initWithCell:[AccountFieldCell class] cellModel:cellModel1];
    LoginItem *item2 = [[LoginItem alloc] initWithCell:[AccountFieldCell class] cellModel:cellModel2];
    LoginItem *item3 = [[LoginItem alloc] initWithCell:[AccountFieldCell class] cellModel:cellModel3];
    LoginItem *item4 = [[LoginItem alloc] initWithCell:[AccountFieldCell class]];
    NSArray *itemArray = @[item1, item2, item3, item4];
    self.group = @[itemArray];
}


- (void)setGroup:(NSArray<NSArray<LoginItem *> *> *)group {
    _group = group;
    [self registerCells];
}


- (void)registerCells {
    for (NSArray <LoginItem *>*items in self.group) {
        for (LoginItem *item in items) {
            [self.tableView registerClass:item.cellClass forCellReuseIdentifier:item.reuseIdentifier];
        }
    }
}


#pragma mark - UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    LoginItem *item = self.group[indexPath.section][indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:item.reuseIdentifier forIndexPath:indexPath];
    [item updateCell:cell];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.group[section].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.group.count;
}

#pragma mark - Constraint
- (void)setupTableViewConstraint {
    /**
     iOS布局之AutoresizingMask和AutoLayout的关系
     iOS布局方式有两种:
     1. AutoresizingMask: 属于旧的布局方式, 主要思想就是设置子视图跟随父视图的frame变化而变化
     typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
     UIViewAutoresizingNone                 = 0,
     UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
     UIViewAutoresizingFlexibleWidth        = 1 << 1,
     UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
     UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
     UIViewAutoresizingFlexibleHeight       = 1 << 4,
     UIViewAutoresizingFlexibleBottomMargin = 1 << 5
     };
     
     2. AutoLayout: 自动布局方式,
     (1)使用之前必须translatesAutoresizingMaskIntoConstraints == false
     (2)translatesAutoresizingMaskIntoConstraints 属性是设置到底使用那种布局方式，默认是true,
     (3)使用xib时view 默认是false
     
     主要思想是相对控件的约束：
     
     方法1:
     +(instancetype)constraintWithItem:(id)view1
     attribute:(NSLayoutAttribute)attr1
     relatedBy:(NSLayoutRelation)relation
     toItem:(nullable id)view2
     attribute:(NSLayoutAttribute)attr2
     multiplier:(CGFloat)multiplier
     constant:(CGFloat)c;
     
     // view1 的某一个约束 = view2的某一个约束 X 多少陪 + 常量
     // relation: 有 <=/=/>= 三种关系, 自动布局时优先使用 = 关系（绝对关系），不满足时再用其他的关系， 因为是相对布局，平时宽度和高度不应该使用 “=” ,除非宽高有固定的要求
     // 使用 eqal 时可能引发的问题：
     （1.）根据内容决定宽度的视图，当内容改变时，外观尺寸无法做出正确的改变
     （2.）过长的文字无法显示
     （3.）约束之间冲突，无法显示正确的布局
     // NSLayoutAttributeLeft 和 NSLayoutAttributeLeading的区别， left 表示的就是左边，而Leading时根据文字习惯区分，表示的是从文字开始的方向，阿拉伯语中表示右边
     // Auto Layout 添加约束的规则
     （1.）同层级视图添加到共同的父视图
     （2.）不同层级试图添加到他们最近的共同父视图
     （3.）有层级关系的添加到，添加到层次较高的父试视图
     */
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint *tableViewTop = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tableViewLeft = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tableViewBottom = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tableViewRight = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    // 需要将约束添加到父试图上
    [self.view addConstraints:@[tableViewTop,tableViewLeft,tableViewBottom,tableViewRight]];
}

#pragma mark - lazy

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 80;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _tableView;
}

@end
