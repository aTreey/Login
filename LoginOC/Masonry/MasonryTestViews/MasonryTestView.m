//
//  MasonryTestView.m
//  LoginOC
//
//  Created by HongpengYu on 2018/6/13.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import "MasonryTestView.h"
#import "Masonry.h"

@implementation MasonryTestView

- (instancetype)init {
    if (self = [super init]) {
        [self testView1];
        [self testView2];
    }
    return self;
}

- (void)testView1 {
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self addSubview:redView];
    
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(100, 50));
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.mas_safeAreaLayoutGuideTop).inset(10);
        } else {
            // Fallback on earlier versions
        }
        make.centerX.equalTo(self);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(blueView.bottom).inset(10);
//            make.bottom.equalTo(self.mas_safeAreaLayoutGuideBottom).inset(10);
        } else {
            make.top.equalTo(blueView).inset(10);
//            make.bottom.trailing.equalTo(self).inset(10);
        }
        make.leading.trailing.equalTo(self).inset(10);
        make.height.equalTo(blueView);
        
    }];
    
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.greaterThanOrEqualTo(self.top).offset(10);
//        make.leading.equalTo(self).offset(10);
//        make.bottom.trailing.equalTo(self).offset(-10);
//    }];
    
}

// 两个高度相等，垂直居中，等宽等间距
- (void)testView2 {
    UIView *yellowdView = [[UIView alloc] init];
    yellowdView.backgroundColor = [UIColor purpleColor];
    [self addSubview:yellowdView];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self addSubview:greenView];
    
    [yellowdView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@150);
        make.top.equalTo(self).inset(220);
        make.leading.equalTo(self).inset(10);
        make.trailing.equalTo(greenView.leading).inset(10);
        make.width.equalTo(greenView);
    }];
    
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(yellowdView);
        make.top.equalTo(yellowdView);
        make.leading.equalTo(greenView.trailing).inset(10);
        make.trailing.equalTo(self).inset(10);
        make.width.equalTo(yellowdView);
    }];
}

@end

#pragma mark - scrollView 布局
@implementation MasonryScrollView

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor grayColor];
    [self addSubview:scrollView];
    
    [scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(120, 5, 100, 5));
    }];
    
    
    // 需要创建一个容器，存放创建的子控件
    UIView *containerView = [[UIView alloc] init];
    [scrollView addSubview:containerView];
    
    [containerView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    UILabel *lastLabel = nil;
    CGFloat labelHeight = 30;
    for (NSInteger i = 0; i < 30; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:@"第%ld个", i];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [self randomColor];
        
        [scrollView addSubview:label];
        
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastLabel ? lastLabel.bottom : @0);
            make.leading.equalTo(@0);
            make.trailing.equalTo(self);
            make.height.equalTo(@(labelHeight));
            
        }];
        
        labelHeight += 10;
        lastLabel = label;
    }
    
    [containerView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastLabel.bottom);
    }];
    
    return self;
}


- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end


