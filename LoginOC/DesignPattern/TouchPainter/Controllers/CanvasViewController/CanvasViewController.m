//
//  CanvasViewController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/19.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "CanvasViewController.h"

@interface CanvasViewController ()

@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 使用 CanvasViewGenerator 的工厂方法取得默认的画布视图
    CanvasViewGenerator *defaultGenerator = [[CanvasViewGenerator alloc] init];
    [self loadCanvasViewWithGenerator:defaultGenerator];
}

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
    [self.canvasView removeFromSuperview];
    CGRect aFrame = CGRectMake(0, 0, 320, 436);
    CanvasView *aCanvasView = [generator canvasViewWithFrame:aFrame];
    self.canvasView = aCanvasView;
    [self.view addSubview:aCanvasView];
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
