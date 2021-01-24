//
//  DropitViewController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/23.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "DropitViewController.h"
#import "DropitBehavior.h"
#import "BezierPathView.h"


@interface DropitViewController () <UIDynamicAnimatorDelegate>

@property (weak, nonatomic) IBOutlet BezierPathView *gameView;
/// 仿真动画
@property (nonatomic, strong) UIDynamicAnimator *animator;
/// 自定义动画行为
@property (nonatomic, strong) DropitBehavior *dropitBehivor;
@property (nonatomic, strong) UIAttachmentBehavior *attachment;
@property (nonatomic, strong) UIView *dropView;


@end

@implementation DropitViewController

static const CGSize DROP_SIZE = {50, 50};

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - Public Methods

#pragma mark - Events

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    
    [self drop];
}

- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    CGPoint gesturePoint = [sender locationInView:self.gameView];
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self attachDropingViewToPoint:gesturePoint];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        self.attachment.anchorPoint = gesturePoint;
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        [self.animator removeBehavior:self.attachment];
        self.gameView.path = nil;
    }
}
#pragma mark - UITextFieldDelegate

#pragma mark - UITableViewDelegate

#pragma mark - UIOtherComponentDelegate

#pragma mark - UIDynamicAnimatorDelegate
- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator {
    [self removeCompletedRows];
}

#pragma mark - Private Methods

- (void)attachDropingViewToPoint:(CGPoint)point {
    if (self.dropView) {
        self.attachment = [[UIAttachmentBehavior alloc] initWithItem:self.dropView attachedToAnchor:point];
        // 临时记录，因为block是在 self.dropView = nil 后执行;
        UIView *dropView = self.dropView;
        __weak __typeof(self)weakSelf = self;
        self.attachment.action = ^{
            UIBezierPath *path = [[UIBezierPath alloc] init];
            [path moveToPoint:weakSelf.attachment.anchorPoint];
            [path addLineToPoint:dropView.center];
            weakSelf.gameView.path = path;
        };
        self.dropView = nil;
        [self.animator addBehavior:self.attachment];
    }
}

- (BOOL)removeCompletedRows {
    NSMutableArray *dropsToRemove = [NSMutableArray array];
    CGFloat y = self.gameView.bounds.size.height - DROP_SIZE.height / 2;
    for (CGFloat y = self.gameView.bounds.size.height - DROP_SIZE.height / 2; y > 0; y -= DROP_SIZE.height) {
        BOOL rowsIsComplete = YES;
        NSMutableArray *dropsFound = [NSMutableArray array];
        for (CGFloat x = DROP_SIZE.width / 2; x <= self.gameView.bounds.size.width - DROP_SIZE.width / 2.0; x += DROP_SIZE.width) {
            UIView *hitView = [self.gameView hitTest:CGPointMake(x, y) withEvent:NULL];
            if (hitView.superview == self.gameView) {
                [dropsFound addObject:hitView];
            } else {
                rowsIsComplete = NO;
            }
        }
        if (dropsFound.count == 0) {
            break;
        }
        if (rowsIsComplete) {
            [dropsToRemove addObjectsFromArray:dropsFound];
        }
    }
    
    if (dropsToRemove.count > 4) {
        for (UIView *dropView in dropsToRemove) {
            [self.dropitBehivor removeItem:dropView];
        }
        [self animateRemovingDrop:dropsToRemove];
    }
    
    return NO;
}

- (void)animateRemovingDrop:(NSArray *)drops {
    [UIView animateWithDuration:1.0
                     animations:^{
        for (UIView *dropView in drops) {
            int x = (arc4random() %  (int)self.gameView.bounds.size.width * 5)  - (int)self.gameView.bounds.size.width * 2;
            int y = self.gameView.bounds.size.height;
            dropView.center = CGPointMake(x, -y);
        }
    }
                     completion:^(BOOL finished) {
        [drops makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }];
}

- (void)drop {
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    
    NSUInteger x = arc4random() %  (NSUInteger)(self.gameView.bounds.size.width) / DROP_SIZE.width;
    frame.origin.x = x * DROP_SIZE.width;
    
    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor = [self randomColor];
    
    [self.gameView addSubview:dropView];
    
    self.dropView = dropView;
    
    // 为视图添加行为
    [self.dropitBehivor addItem:dropView];
}

- (UIColor *)randomColor {
    switch (arc4random() % 5) {
        case 0:
            return [UIColor greenColor];
        case 1:
            return [UIColor blueColor];
        case 2:
            return [UIColor orangeColor];
        case 3:
            return [UIColor redColor];
        case 4:
            return [UIColor purpleColor];
    }
    
    return [UIColor blackColor];
}

- (UIDynamicAnimator *)animator {
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameView];
        _animator.delegate = self;
    }
    return _animator;
}

- (DropitBehavior *)dropitBehivor {
    if (!_dropitBehivor) {
        _dropitBehivor = [[DropitBehavior alloc] init];
        [self.animator addBehavior:_dropitBehivor];
    }
    return _dropitBehivor;
}

@end
