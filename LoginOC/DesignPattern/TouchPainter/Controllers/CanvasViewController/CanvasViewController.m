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
#import "Stroke.h"
#import "Vertex.h"
#import "Dot.h"

@interface CanvasViewController ()
@property (weak, nonatomic) IBOutlet UIToolbar *toolBarView;
@property (nonatomic, strong) IBOutlet Person_xibObject *person;
@property (nonatomic, strong, readwrite) Scribble *scribble;
@property (nonatomic, assign) CGPoint startPoint;

@end

@implementation CanvasViewController

#pragma mark -
#pragma mark 绑定数据，添加KVO

// 把所有东西挂接到 Scribble 的实例
- (void)setScribble:(Scribble *)scribble {
    _scribble = scribble;
    
    // 把自己作为观察者添加到scribble
    // 观察其内部变化状态——Mark的任何变化
    [_scribble addObserver:self forKeyPath:@"mark" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionOld context:nil];
}

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
    [CoordinatingController sharedInstance];
}

- (void)updateViewConstraints {
    [self.canvasView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.leading.trailing.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.toolBarView.mas_top);
    }];
    [super updateViewConstraints];
}

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
    [self.canvasView removeFromSuperview];
//    CGRect aFrame = CGRectMake(0, 0, 320, 436);
    CanvasView *aCanvasView = [generator canvasViewWithFrame:CGRectZero];
    self.canvasView = aCanvasView;
    self.canvasView.backgroundColor = [UIColor lightGrayColor];
    NSInteger viewIndex = self.view.subviews.count - 1;
    [self.view insertSubview:aCanvasView atIndex:viewIndex];
    [self.view updateConstraintsIfNeeded];
}

#pragma mark -
#pragma mark Touch Event Handlers

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 触摸的开始位置
    self.startPoint = [[touches anyObject] locationInView:self.canvasView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGPoint lastPoint = [[touches anyObject] preciseLocationInView:self.canvasView];
    // 如果是手指拖动，就向涂鸦添加一个线条
    if (CGPointEqualToPoint(lastPoint, self.startPoint)) {
        id <Mark> newStroke = [[Stroke alloc] init];
        [newStroke setColor:self.strokeColor];
        [newStroke setSize:self.strokeSize];
        [self.scribble addMark:newStroke shouldAddToPreviousMark:NO];
    }
    
    // 把当前触摸作为顶点添加到临时线条
    CGPoint thisPoint = [[touches anyObject] locationInView:self.canvasView];
    Vertex *vertex = [[Vertex alloc] initWithLocation:thisPoint];
    
    // 我们不需要撤销每个顶点
    // 所以我们保留这个，需要把输入的Mark对象作为一个部分附加到原有的聚合体中
    [self.scribble addMark:vertex shouldAddToPreviousMark:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:self.canvasView];
    CGPoint thisPoint = [[touches anyObject] locationInView:self.canvasView];
    
    // 如果触摸从未移动（抬起之前一直在同一处）
    // 就向组合体中添加一个点
    // 否则就把它作为最后一个顶点添加到临时线条
    if (CGPointEqualToPoint(lastPoint, thisPoint)) {
        Dot *singleDot = [[Dot alloc] initWithLocation:thisPoint];
        [singleDot setColor:self.strokeColor];
        [singleDot setSize:self.strokeSize];
        [self.scribble addMark:singleDot shouldAddToPreviousMark:NO];
    }
    
    // 在此重置起点
    self.startPoint = CGPointZero;
    // 如果这是线条的最后一点，就不用画出来，因为用户也看不见区别
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 防止万一，在此处也重置
    self.startPoint = CGPointZero;
}

#pragma mark -
#pragma mark Scribble observer method

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[Scribble class]] && [keyPath isEqualToString:@"mark"]) {
        id <Mark> mark = [change objectForKey:NSKeyValueChangeNewKey];
        self.canvasView.mark = mark;
        [self.canvasView updateConstraintsIfNeeded];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - setter


@end
