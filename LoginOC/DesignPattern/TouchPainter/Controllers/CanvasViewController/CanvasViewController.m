//
//  CanvasViewController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/19.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "CanvasViewController.h"
#import "Person_xibObject.h"
#import "CoordinatingController.h"

@interface CanvasViewController ()
@property (weak, nonatomic) IBOutlet UIToolbar *toolBarView;
@property (nonatomic, strong) IBOutlet Person_xibObject *person;

@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.coordinatingController = [CoordinatingController sharedInstance];
    // 使用 CanvasViewGenerator 的工厂方法取得默认的画布视图
    CanvasViewGenerator *defaultGenerator = [[CanvasViewGenerator alloc] init];
    [self loadCanvasViewWithGenerator:defaultGenerator];
}

- (void)updateViewConstraints {
    [self.canvasView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.toolBarView.mas_top);
    }];
    [super updateViewConstraints];
}

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
    [self.canvasView removeFromSuperview];
//    CGRect aFrame = CGRectMake(0, 0, 320, 436);
    CanvasView *aCanvasView = [generator canvasViewWithFrame:CGRectZero];
    self.canvasView = aCanvasView;
    [self.view addSubview:aCanvasView];
    [self.view updateConstraintsIfNeeded];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
