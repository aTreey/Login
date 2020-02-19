//
//  MasonryController.m
//  LoginOC
//
//  Created by HongpengYu on 2018/6/13.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "MasonryController.h"
#import "MasonryTestController.h"
#import "MasonryAutoLayoutController.h"
#import "HorizontalTwoLabel.h"

#import "MasonryTestView.h"

@interface MasonryController ()

@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, strong) NSArray *section2Datas;

@end

@implementation MasonryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"masonryAutolayoutCell"];
    
    self.datas = @[
                   [[MasonryTestController alloc] initWithTitle:@"尺寸/位置/约束冲突" viewClass:MasonryTestView.class],
                   [[MasonryTestController alloc] initWithTitle:@"scrollView" viewClass:MasonryScrollView.class],
                   [[MasonryTestController alloc] initWithTitle:@"中心约束" viewClass:MasonryCenterView.class],
                   [[MasonryTestController alloc] initWithTitle:@"更新约束" viewClass:MasonryUpdateView.class],
                   [[MasonryTestController alloc] initWithTitle:@"移除约束" viewClass:MasonryRemakeView.class],
                   [[MasonryTestController alloc] initWithTitle:@"多个控件边距" viewClass:MasonrymutltiEdgeView.class],
                   [[MasonryTestController alloc] initWithTitle:@"固定宽高比" viewClass:MasonryAutoFitView.class],
                   [[MasonryTestController alloc] initWithTitle:@"多行文本" viewClass:MasonryMultiLabelView.class],
                   [[MasonryTestController alloc] initWithTitle:@"使用数组约束多个控件" viewClass:MasonryArrayView.class],
                   [[MasonryTestController alloc] initWithTitle:@"多个控件线性布局约束" viewClass:MasonryCollectView.class],
                   [[MasonryTestController alloc] initWithTitle:@"批量约束" viewClass:MasonryBatchView.class],
                   [[MasonryTestController alloc] initWithTitle:@"动画" viewClass:MasonryAnimationView.class],
                   
                   [[MasonryTestController alloc] initWithTitle:@"iPhoneX" viewClass:MasonryiPhoneXView.class]
                   ];
    
    
    self.section2Datas = @[
                            [[MasonryAutoLayoutController alloc] initWithTitle:@"1.并排label" viewClass:HorizontalTwoLabel.class],
                            ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? self.datas.count : self.section2Datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        UIViewController *controller = self.datas[indexPath.row];
        cell.textLabel.text = controller.title;
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"masonryAutolayoutCell"];
        UIViewController *controller = self.section2Datas[indexPath.row];
        cell.textLabel.text = controller.title;
        return cell;
    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    UIViewController *controller = nil;
    if (indexPath.section == 0) {
        controller = self.datas[indexPath.row];
    } else {
        controller = self.section2Datas[indexPath.row];
    }
    [self.navigationController pushViewController:controller animated:true];
}

@end
