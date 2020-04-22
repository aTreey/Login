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
@property (nonatomic, strong, readwrite) Scribble *scribble;


@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置默认画布
//    self.coordinatingController = [CoordinatingController sharedInstance];
    // 使用 CanvasViewGenerator 的工厂方法取得默认的画布视图
    CanvasViewGenerator *defaultGenerator = [[CanvasViewGenerator alloc] init];
    [self loadCanvasViewWithGenerator:defaultGenerator];
    
    
    // 初始化 Scribble 模型
    Scribble *scribble = [[Scribble alloc] init];
    [self setScribble:scribble];
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


#pragma mark - setter

// 把所有东西挂接到 Scribble 的实例
- (void)setScribble:(Scribble *)scribble {
    _scribble = scribble;
    
    // 把自己作为观察者添加到scribble
    // 观察其内部变化状态——Mark的任何变化
    [_scribble addObserver:self forKeyPath:@"mark" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionOld context:nil];
}

@end
