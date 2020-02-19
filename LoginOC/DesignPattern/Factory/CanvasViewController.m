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
    
    CanvasViewGenerator *defaultGenerator = [[CanvasViewGenerator alloc] init];
    [self loadCanvasViewWithGenerator:defaultGenerator];
}

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
  [self.canvasView removeFromSuperview];
  CGRect aFrame = CGRectMake(0, 0, 320, 436);
  CanvasView *aCanvasView = [generator canvasViewWithFrame:aFrame];
  [self setCanvasView:aCanvasView];
  NSInteger viewIndex = [[[self view] subviews] count] - 1;
  [[self view] insertSubview:self.canvasView atIndex:viewIndex];
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
