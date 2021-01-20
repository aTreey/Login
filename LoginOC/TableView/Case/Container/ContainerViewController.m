//
//  ContainerViewController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/7.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController () <ContainerViewDelegate>

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view insertSubview:self.bottomView atIndex:0];
    [self.view addSubview:self.shadowButton];
    
    self.containerShadowView = YES;
    [self.view addSubview:self.containerView];
    
    
    self.view.backgroundColor = [UIColor redColor];
    self.bottomView.backgroundColor = [UIColor yellowColor];
    self.shadowButton.backgroundColor = [UIColor blackColor];
}

#pragma mark - ContainerView Delegate

- (void)changeContainerMove:(ContainerMoveType)containerMove containerY:(CGFloat)containerY animated:(BOOL)animated {
    
    if(containerMove == ContainerMoveTypeBottom) {
        [self.view endEditing:YES];
    }
    
    if(animated) {
        ANIMATION_SPRING(.45,^(void){
            [self changeScalesImageAndShadowLevel:containerY];
        });
    } else {
        [self changeScalesImageAndShadowLevel:containerY];
    }
}

#pragma mark - Change ShadowLevel

- (void)changeScalesImageAndShadowLevel:(CGFloat)containerFrameY {
    CGFloat selfCenter = self.containerView.containerMiddle;
    if (containerFrameY < selfCenter) {
        
        CGFloat procent = (((selfCenter - containerFrameY) / selfCenter) / 2);
        
        CGAffineTransform transform = CGAffineTransformMakeScale( 1. - (procent / 5), 1. - (procent / 5));
        
        if(self.containerZoom) {
            self.bottomView.transform = transform;
            self.bottomView.layer.cornerRadius = (procent * 24);
        } else {
            self.bottomView.transform = CGAffineTransformIdentity;
            self.bottomView.layer.cornerRadius = 0;
        }
        
        self.shadowButton.alpha = procent;
        
        CGFloat height;
        if(self.containerView.portrait)
             height = (containerFrameY + self.containerView.containerCornerRadius +5);
        else height = SCREEN_HEIGHT;
        
        self.shadowButton.frame = CGRectMake( self.shadowButton.frame.origin.x,self.shadowButton.frame.origin.y, self.shadowButton.frame.size.width, height);
    } else {
        self.bottomView.transform = CGAffineTransformIdentity;
        self.bottomView.layer.cornerRadius = 0;
        
        self.shadowButton.alpha = 0.;
        self.shadowButton.frame = CGRectMake( self.shadowButton.frame.origin.x, self.shadowButton.frame.origin.y, self.shadowButton.frame.size.width, SCREEN_HEIGHT);
    }
}

#pragma mark - Container Move

- (void)containerMove:(ContainerMoveType)moveType {
    [self.containerView containerMove:moveType];
}

- (void)containerMove:(ContainerMoveType)moveType animated:(BOOL)animated {
    [self.containerView containerMove:moveType animated:animated];
}

- (void)containerMove:(ContainerMoveType)moveType animated:(BOOL)animated completion:(void (^)(void))completion {
    [self.containerView containerMove:moveType animated:animated completion:completion];
}


#pragma mark - getter

- (ContainerView *)containerView {
    
    if(!_containerView) {
        ContainerView *
        container = [[ContainerView alloc] initWithFrame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT + Container_Extra_Height)];
        container.delegate = self;
        _containerView = container;
    }
    return _containerView;
}

- (UIView *)bottomView {
    if(!_bottomView) {
        
        UIView *
        view = [[UIView alloc]initWithFrame:self.view.bounds];
        view.backgroundColor = [UIColor clearColor];
        view.clipsToBounds = YES;
        view.autoresizingMask =
        (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin |
         UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin);
        _bottomView = view;
        for( UIView * v in self.view.subviews ) {
            [_bottomView addSubview:v];
        }
    }
    return _bottomView;
}

- (UIButton *)shadowButton {
    
    if(!_shadowButton) {
        UIButton *
        shadow = [UIButton buttonWithType:UIButtonTypeCustom];
        [shadow addTarget:self action:@selector(shadowButtonAction) forControlEvents:UIControlEventTouchUpInside];
        shadow.frame = FRAME;
        shadow.backgroundColor = [UIColor blackColor];
        shadow.alpha = 0;
        shadow.autoresizingMask =
        (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin);
        _shadowButton = shadow;

        [self.view addSubview:_shadowButton];
    }
    return _shadowButton;
}

// 当前位置
- (ContainerMoveType)containerPosition {
    return self.containerView.containerPosition;
}

#pragma mark - Action

- (void)shadowButtonAction {
    [self containerMove:ContainerMoveTypeBottom];
}

@end
