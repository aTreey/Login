//
//  EffectiveListController.m
//  LoginOC
//
//  Created by HongpengYu on 2018/8/31.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EffectiveListController.h"
#import "EffectiveDetailController.h"

@interface EffectiveListController ()
@property (nonatomic, strong) NSArray *listArray;
@end

@implementation EffectiveListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.listArray = @[
                       @"Protocol和Category",
                       @"AutomaticReferenceCountingController"
                       ];
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        EffectiveDetailController *controller = [EffectiveDetailController new];
        controller.title = self.listArray[indexPath.row];
        [self.navigationController pushViewController:controller animated:true];
    } else {
        UIViewController *controller = [[NSClassFromString(self.listArray[indexPath.row]) alloc] init];
        controller.title = self.listArray[indexPath.row];
        [self.navigationController pushViewController:controller animated:true];
    }
}


#pragma mark - dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.listArray[indexPath.row];
    return cell;
}

@end
