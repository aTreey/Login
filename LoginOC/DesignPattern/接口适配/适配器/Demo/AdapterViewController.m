//
//  AdapterViewController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/27.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "AdapterViewController.h"
#import "BusinessCardView.h"
#import "NormalModel.h"
#import "NormalModelAdapter.h"
#import "NormalModel2.h"
#import "NormalModel2Adapter.h"


static const CGSize CardViewSize = {300, 200};

@interface AdapterViewController ()

@property (nonatomic, weak) BusinessCardView *cardView;

@end

@implementation AdapterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//
    [self createCardView];
    
    [self updateCardViewValue];
    
    [self loadDataWithModel];
    
    [self loadData];
    
    [self loadNormal2Data];
    
//    [self.view updateConstraintsIfNeeded];
}


// 创建CardView
- (void)createCardView {
    BusinessCardView *cardView = [[BusinessCardView alloc] initWithFrame:CGRectZero];
    cardView.backgroundColor = [UIColor cyanColor];

    self.cardView = cardView;
    [self.view addSubview:cardView];
    cardView.translatesAutoresizingMaskIntoConstraints = NO;
    [cardView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [cardView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [cardView.widthAnchor constraintEqualToConstant:CardViewSize.width].active = YES;
    [cardView.heightAnchor constraintEqualToConstant:CardViewSize.height].active = YES;
}

/// 直接赋值
- (void)updateCardViewValue {
    self.cardView.name = @"张三";
    self.cardView.lineColor = [UIColor redColor];
    self.cardView.phoneNumber = @"100000";
}

/// 使用 model，让view 和model 产生耦合
- (void)loadDataWithModel {
    [self.cardView loadDataWithModel:[NormalModel model]];
}

/// 使用 适配器设计模式，使view适配各种不同的数据
- (void)loadData {
    
    NormalModel *model = [NormalModel model];
    // 与输入建立联系
    NormalModelAdapter *modelAdapter = [[NormalModelAdapter alloc] initWithData:model];
    // 与view层建立联系
    [self.cardView loadData:modelAdapter];
}


///////////////////////
/// 适配Normal2Data
- (void)loadNormal2Data {
    
    NormalModel2 *model = [NormalModel2 model];
    // 与输入建立联系
    NormalModel2Adapter *modelAdapter = [[NormalModel2Adapter alloc] initWithData:model];
    // 与view层建立联系
    [self.cardView loadData:modelAdapter];
}


@end
