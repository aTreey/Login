//
//  MasonryController.m
//  LoginOC
//
//  Created by HongpengYu on 2018/6/13.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "MasonryController.h"
#import "MasonryTestController.h"

#import "MasonryTestView.h"

@interface MasonryController ()
@property (nonatomic, strong) NSArray *datas;
@end

@implementation MasonryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.datas = @[
                   [[MasonryTestController alloc] initWithTitle:@"基础" viewClass:MasonryTestView.class],
                   [[MasonryTestController alloc] initWithTitle:@"scrollView" viewClass:MasonryScrollView.class],
                   [[MasonryTestController alloc] initWithTitle:@"基础" viewClass:MasonryTestView.class],
                   [[MasonryTestController alloc] initWithTitle:@"基础" viewClass:MasonryTestView.class],
                   [[MasonryTestController alloc] initWithTitle:@"基础" viewClass:MasonryTestView.class],
                   [[MasonryTestController alloc] initWithTitle:@"基础" viewClass:MasonryTestView.class],
                   [[MasonryTestController alloc] initWithTitle:@"基础" viewClass:MasonryTestView.class]
                   ];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UIViewController *controller = self.datas[indexPath.row];
    cell.textLabel.text = controller.title;
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    UIViewController *controller = self.datas[indexPath.row];
    [self.navigationController pushViewController:controller animated:true];
}

@end
