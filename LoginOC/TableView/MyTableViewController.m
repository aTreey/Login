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
#import <CTMediator/CTMediator.h>
#import <DesignPattern_Category/CTMediator+DesignPattern.h>


@interface MyTableViewController ()
@property (nonatomic, strong) NSArray *datas;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _datas = @[
                @[
                    @"TableHeaderScaleController",
                    @"SOAPController",
                    @"SCRecorderController",
                    @"ContainerViewController",
                   @"FormViewController",
                   @"CanvasViewController",
                   @"PaletteViewController",
                   @"BridgeViewController",
                   @"ObserverPatternViewController"
                ],
               
               @[
                   @"PlayingCardGameViewController",
                   @"AttributeStringViewController",
                   @"CardViewController",
                   @"DropitViewController",
               ],
                
               @[
                   @"AdapterViewController",
                   @"BridgeViewController"
               ]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _datas[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = nil;
    if (indexPath.section == 2) {
        controller = [[CTMediator sharedInstance] DesignPattern_ViewController:@{@"className": self.datas[indexPath.section][indexPath.row]}];
    } else {
        Class class = NSClassFromString(_datas[indexPath.section][indexPath.row]);
        controller = [class new];
        if ([controller isKindOfClass:[CanvasViewController class]]) {
            [self handleCanvasViewController:controller];
        }
    }
    
    [self.navigationController pushViewController:controller animated:true];
}

// 指定画布类型
- (void)handleCanvasViewController:(UIViewController *)controller{
    CanvasViewController *vc = (CanvasViewController *)controller;
    PaperCanvasViewGenerator *paperGenerator = [PaperCanvasViewGenerator new];
    ClothCanvasViewGenerator *clothGenerator = [ClothCanvasViewGenerator new];
    [vc loadCanvasViewWithGenerator:paperGenerator];
}

- (CGFloat)containerTop {
    return _containerTop;
}

@end
