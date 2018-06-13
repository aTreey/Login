//
//  LoginController.m
//  LoginOC
//
//  Created by liepin on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LoginController.h"
#import "LoginItem.h"

#import "LoginLogoCell.h"
#import "LoginTitleCell.h"
#import "AccountFieldCell.h"
#import "LoginButtonCell.h"
#import "LoginDetailCell.h"

#import "AccoutCellModel.h"
#import "LoginTitleCellModel.h"
#import "LoginLogoCellModel.h"
#import "LoginButtonCellModel.h"

@interface LoginController () <UITableViewDataSource, UITableViewDelegate, LoginCellButtonActionable>

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
    
    LoginLogoCellModel *logoModel = [[LoginLogoCellModel alloc] init];
    LoginTitleCellModel *titleModel = [[LoginTitleCellModel alloc] initWithTitle:@"乐班班"];
    AccoutCellModel *accountModel = [[AccoutCellModel alloc] initWithTips:@"账号" placeholder:@"请输入您的账户"];
    AccoutCellModel *passwordModel = [[AccoutCellModel alloc] initWithTips:@"密码" placeholder:@"请输入您的密码"];
    LoginButtonCellModel *loginButtonModel = [[LoginButtonCellModel alloc] initWithTite:@"登录" titleColor:[UIColor whiteColor] backgroundColor:[UIColor orangeColor] cornerRadius:6.0 height: 50];
    
    LoginItem *item1 = [[LoginItem alloc] initWithCell:[LoginLogoCell class]
                                             cellModel:logoModel];
    LoginItem *item2 = [[LoginItem alloc] initWithCell:[LoginTitleCell class]
                                             cellModel:titleModel];
    LoginItem *item3 = [[LoginItem alloc] initWithCell:[AccountFieldCell class]
                                             cellModel:accountModel];
    LoginItem *item4 = [[LoginItem alloc] initWithCell:[AccountFieldCell class]
                                             cellModel:passwordModel];
    LoginItem *item5 = [[LoginItem alloc] initWithCell:[LoginButtonCell class]
                                             cellModel:loginButtonModel];
    LoginItem *item6 = [[LoginItem alloc] initWithCell:[LoginDetailCell class]
                                             cellModel:loginButtonModel];
    
    
    NSArray *itemArray = @[item1, item2, item3, item4, item5, item6];
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

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (0 == indexPath.section && 0 == indexPath.row) {
//        return  150;
//    } else {
//        return 80;
//    }
//}



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
     
     2. iOS8之后 AutoLayout: 自动布局方式,
     (1)使用之前必须translatesAutoresizingMaskIntoConstraints == false
     (2)translatesAutoresizingMaskIntoConstraints 属性是设置到底使用那种布局方式，默认是true,
     (3)使用xib时view 默认是false
     
     主要思想是相对控件的约束：
     
     使用方法1:
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
     
    使用方法2. iOS 9.0 之后 出现了 NSLayoutAnchor 布局和 UILayoutGuide
     官方解释
     // A rectangular area that can interact with Auto Layout.（可以与自动布局交互的矩形区域）
     UILayoutGuide 占位视图简化布局效果时的工作量，没有任何内容的UIView只定义一个矩形区域，在自动布局体系中起到占位作用。例如，若干个宽度不等的控件，要求横向排列它们，并且间距相等。此时必须使用占位视图作为间距，否则需要大量计算，十分麻烦
     
     view 有两个与内边距有关的属性，一个叫layoutMargins，一个叫layoutMarginsGuide。layoutMargins是内边距的大小。layoutMarginsGuide指的是内边界。默认的内边距大小是8个点。
     
     layoutMarginsGuide 布局子控件的时候有时候会有问题,没有居中显示，一般情况下使用UILayoutGuide来布局
     （1. ）使用场景：当作容器使用，需求是两个控件组合后居中显示
     =============当作容器使用========
     - (void)containerCenter {
         // 创建layoutGuide
         UILayoutGuide *containerGuide = [[UILayoutGuide alloc] init];
         [self.view addLayoutGuide:containerGuide];
     
         UILabel *label = [[UILabel alloc] init];
         label.text = @"居中显示";
         label.backgroundColor = [UIColor purpleColor];
         label.textColor = [UIColor yellowColor];
         [self.view addSubview:label];
     
         // view1
         UIView *view1 = [[UIView alloc] init];
         view1.backgroundColor = [UIColor cyanColor];
         [self.view addSubview:view1];
     
         // view2
         UIView *view2 = [[UIView alloc] init];
         view2.backgroundColor = [UIColor redColor];
         [self.view addSubview:view2];
     
         // 设置view 为layout布局
         label.translatesAutoresizingMaskIntoConstraints = NO;
         view1.translatesAutoresizingMaskIntoConstraints = NO;
         view2.translatesAutoresizingMaskIntoConstraints = NO;
     
     
         // 设置containerGuide约束
         [containerGuide.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
         [containerGuide.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
         [containerGuide.heightAnchor constraintEqualToConstant:5].active = YES;
     
         // 设置view1约束
         [view1.widthAnchor constraintEqualToConstant:80].active = YES;
         [view1.heightAnchor constraintEqualToConstant:60].active = YES;
         [view1.leftAnchor constraintEqualToAnchor:containerGuide.leftAnchor].active = YES;
         [view1.centerYAnchor constraintEqualToAnchor:containerGuide.centerYAnchor].active = YES;
     
         // 设置label约束
         [label.leftAnchor constraintEqualToAnchor:view1.rightAnchor constant:10].active = YES;
         [label.centerYAnchor constraintEqualToAnchor:containerGuide.centerYAnchor].active = YES;
     
         // 设置view2约束
         [view2.widthAnchor constraintEqualToConstant:120].active = YES;
         [view2.heightAnchor constraintEqualToConstant:40].active = YES;
         [view2.leftAnchor constraintEqualToAnchor:label.rightAnchor constant:20].active = YES;
         [view2.rightAnchor constraintEqualToAnchor:containerGuide.rightAnchor].active = YES;
         [view2.centerYAnchor constraintEqualToAnchor:containerGuide.centerYAnchor].active = YES;
     }
     ==========end===========
     
     (2. ）使用场景：当作占位图,空间之间等间距
     
     - (void)spaceTest {
         // 创建layoutGuide
         UILayoutGuide *space1 = [[UILayoutGuide alloc] init];
         [self.view addLayoutGuide:space1];
         UILayoutGuide *space2 = [[UILayoutGuide alloc] init];
         [self.view addLayoutGuide:space2];
         UILayoutGuide *space3 = [[UILayoutGuide alloc] init];
         [self.view addLayoutGuide:space3];
         UILayoutGuide *space4 = [[UILayoutGuide alloc] init];
         [self.view addLayoutGuide:space4];
     
         UIView *view1 = [[UIView alloc] init];
         view1.backgroundColor = [UIColor cyanColor];
         [self.view addSubview:view1];
     
         UIView *view2 = [[UIView alloc] init];
         view2.backgroundColor = [UIColor redColor];
         [self.view addSubview:view2];
     
         UILabel *label = [[UILabel alloc] init];
         label.text = @"1111";
         label.backgroundColor = [UIColor purpleColor];
         label.textColor = [UIColor yellowColor];
         [self.view addSubview:label];
     
         view1.translatesAutoresizingMaskIntoConstraints = NO;
         view2.translatesAutoresizingMaskIntoConstraints = NO;
         label.translatesAutoresizingMaskIntoConstraints = NO;
     
         [space1.widthAnchor constraintEqualToConstant:40].active = YES;
         [space2.widthAnchor constraintEqualToAnchor:space1.widthAnchor].active = YES;
         [space3.widthAnchor constraintEqualToAnchor:space1.widthAnchor].active = YES;
         [space1.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-100].active = YES;
         [space1.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
     
     
         [view1.heightAnchor constraintEqualToConstant:60].active = YES;
         [view1.widthAnchor constraintEqualToConstant:30].active = YES;
     
         [view2.heightAnchor constraintEqualToConstant:90].active = YES;
         [view2.widthAnchor constraintEqualToConstant:30].active = YES;
     
         [view1.centerYAnchor constraintEqualToAnchor:space1.centerYAnchor].active = YES;
         [view2.centerYAnchor constraintEqualToAnchor:space1.centerYAnchor].active = YES;
         [label.centerYAnchor constraintEqualToAnchor:space1.centerYAnchor].active = YES;
     
         [view1.leadingAnchor constraintEqualToAnchor:space1.trailingAnchor].active = YES;
         [space2.leadingAnchor constraintEqualToAnchor:view1.trailingAnchor].active = YES;
         [view2.leadingAnchor constraintEqualToAnchor:space2.trailingAnchor].active = YES;
         [space3.leadingAnchor constraintEqualToAnchor:view2.trailingAnchor].active = YES;
         [label.leadingAnchor constraintEqualToAnchor:space3.trailingAnchor].active = YES;
     }

     
     
     4. topLayoutGuide 和 bottomLayoutGuide
        两者都是ViewController 的属性，iOS7 就已经可以用了
        // 官方注释如下
     // These objects may be used as layout items in the NSLayoutConstraint API
     @property(nonatomic,readonly,strong) id<UILayoutSupport> topLayoutGuide API_DEPRECATED("Use view.safeAreaLayoutGuide.topAnchor instead of topLayoutGuide.bottomAnchor", ios(7.0,11.0), tvos(7.0,11.0));
     @property(nonatomic,readonly,strong) id<UILayoutSupport> bottomLayoutGuide API_DEPRECATED("Use view.safeAreaLayoutGuide.bottomAnchor instead of bottomLayoutGuide.topAnchor", ios(7.0,11.0), tvos(7.0,11.0));
     
        iOS 11 之后以上两个属性过期,使用 self.view.safeAreaLayoutGuide.topAnchor 来调用
     使用此属性可以方便的来适配iPhoneX
     
     官方Demo:
     // 布局元素之间的间距
     UILayoutGuide *space1 = [[UILayoutGuide alloc] init];
     [self.view addLayoutGuide:space1];
     
     UILayoutGuide *space2 = [[UILayoutGuide alloc] init];
     [self.view addLayoutGuide:space2];
     
     [space1.widthAnchor constraintEqualToAnchor:space2.widthAnchor].active = YES;
     [self.saveButton.trailingAnchor constraintEqualToAnchor:space1.leadingAnchor].active = YES;
     [self.cancelButton.leadingAnchor constraintEqualToAnchor:space1.trailingAnchor].active = YES;
     [self.cancelButton.trailingAnchor constraintEqualToAnchor:space2.leadingAnchor].active = YES;
     [self.clearButton.leadingAnchor constraintEqualToAnchor:space2.trailingAnchor].active = YES;
     
     */
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint *tableViewTop = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tableViewLeft = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tableViewBottom = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tableViewRight = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    // 需要将约束添加到父试图上
    [self.view addConstraints:@[tableViewTop,tableViewLeft,tableViewBottom,tableViewRight]];
}


#pragma mark - cell 按钮点击
- (void)cellButtonAction:(UIButton *)sender {
    NSLog(@"cell-----click");
}


#pragma mark - lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 150;
        _tableView.dataSource = self;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _tableView;
}




@end
