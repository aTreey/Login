//
//  MyTableViewController.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/13.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "MyTableViewController.h"
#import "CanvasViewController.h"
#import "PaperCanvasViewGenerator.h"
#import "ClothCanvasViewGenerator.h"

@interface MyTableViewController ()
@property (nonatomic, strong) NSArray *datas;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _datas = @[@"TableHeaderScaleController",
               @"SOAPController",
               @"SCRecorderController",
               @"FormViewController",
               @"CanvasViewController",
               @"PaletteViewController"
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
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _datas[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class class = NSClassFromString(_datas[indexPath.row]);
    UIViewController *controller = [class new];
    if ([controller isKindOfClass:[CanvasViewController class]]) {
        [self handleCanvasViewController:controller];
    }
    
    [self.navigationController pushViewController:controller animated:true];
}

// 指定画布类型
- (void)handleCanvasViewController:(UIViewController *)controller{
    CanvasViewController *vc = (CanvasViewController *)controller;
    PaperCanvasViewGenerator *paperGenerator = [PaperCanvasViewGenerator new];
    ClothCanvasViewGenerator *clothGenerator = [ClothCanvasViewGenerator new];
    [vc loadCanvasViewWithGenerator:clothGenerator];
}

@end
