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

// 1.1基本使用
- (void)testView1 {
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self addSubview:redView];
    
    // size
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(100, 50));
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.mas_safeAreaLayoutGuideTop).inset(10);
        } else {
            // Fallback on earlier versions
        }
        make.centerX.equalTo(self);
    }];
    
    // 边距
    UIEdgeInsets edge = UIEdgeInsetsMake(200, 10, 100, 10);
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(edge);
    }];
}

// 两个高度相等，垂直居中，等宽等间距
- (void)testView2 {
    UIView *yellowdView = [[UIView alloc] init];
    yellowdView.backgroundColor = [UIColor yellowColor];
    [self addSubview:yellowdView];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self addSubview:greenView];
    
//    yellowdView.mas_key = @"yellowdView";
    [yellowdView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@150);
        make.top.equalTo(self).inset(220);
        make.leading.equalTo(self).inset(10);
        make.trailing.equalTo(greenView.leading).inset(10);
        make.width.equalTo(greenView);
        make.height.equalTo(300);
    }];
    
//    greenView.mas_key = @"greenView";
    
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(yellowdView).key(@"greenView-height");
        make.top.equalTo(yellowdView).key(@"greenView-top");
        make.width.equalTo(yellowdView).key(@"greenView-width");
        make.trailing.equalTo(self).inset(10).key(@"greenView-trailing");
        // 冲突约束
        make.leading.equalTo(greenView.trailing).inset(10).key(@"greenView-leading");
    }];
    
    MASAttachKeys(greenView, yellowdView);
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
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(10, 5, 10, 5));
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


@implementation MasonryCenterView

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    UIView *yellowdView = [[UIView alloc] init];
    yellowdView.backgroundColor = [UIColor purpleColor];
    [self addSubview:yellowdView];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self addSubview:greenView];
    
    // 偏移中心点位置 100
    CGPoint centerOffset = CGPointMake(100, 200);
    [yellowdView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self).centerOffset(centerOffset);
        make.size.equalTo(CGSizeMake(100, 200));
    }];
    
    // 中心位置
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.equalTo(CGSizeMake(100, 200));
    }];
    
    return self;
}

@end



#pragma mark - Upate
@interface MasonryUpdateView ()
@property (nonatomic, assign) CGSize buttonSize;
@property (nonatomic, strong) UIButton *growingButton;
@end
@implementation MasonryUpdateView
- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    
    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_growingButton setTitle:@"更新约束!" forState:UIControlStateNormal];
    _growingButton.backgroundColor = [UIColor orangeColor];
    _growingButton.layer.borderColor = UIColor.greenColor.CGColor;
    _growingButton.layer.borderWidth = 3;
    [_growingButton addTarget:self action:@selector(growingButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_growingButton];
    
    _buttonSize = CGSizeMake(100, 40);
    [_growingButton makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(_buttonSize);
        make.top.equalTo(self).inset(64);
    }];
    
    return self;
}

// 一般自定义view 的时候重写次方法添加约束，
- (void)updateConstraints {
    
    [_growingButton updateConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(_buttonSize);
        make.top.equalTo(self).inset(64);
    }];
    
    // 调用super
    [super updateConstraints];
}


- (void)growingButtonAction {
    _buttonSize = CGSizeMake(_buttonSize.width * 1.2, _buttonSize.height * 1.2);
    [_growingButton updateConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(_buttonSize);
        make.top.equalTo(self).inset(64);
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _buttonSize = CGSizeMake(_buttonSize.width * 0.8, _buttonSize.height * 0.9);
    [_growingButton updateConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(_buttonSize);
        make.top.equalTo(self).inset(64);
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];
}

@end

@interface MasonryRemakeView ()
@property (nonatomic, assign) CGSize buttonSize;
@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) BOOL isCenter;
@property (nonatomic, assign) BOOL isTop;

@end

@implementation MasonryRemakeView

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    
    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_growingButton setTitle:@"移除约束" forState:UIControlStateNormal];
    _growingButton.backgroundColor = [UIColor redColor];
    _growingButton.layer.borderColor = UIColor.greenColor.CGColor;
    _growingButton.layer.borderWidth = 3;
    [_growingButton addTarget:self action:@selector(remakeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_growingButton];
    
    _buttonSize = CGSizeMake(100, 100);
    
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

// 苹果推荐的约束书写位置, 必须实现 `requiresConstraintBasedLayout` 方法返回为 `true`
- (void)updateConstraints {
    
    self.isCenter = !self.isCenter;
    CGFloat margin = 10;
    // 移除所有的约束，重新添加
    [_growingButton remakeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(_buttonSize);
        
        if (_isCenter) {
            make.center.equalTo(self);
        }
        else if (!_isTop) {
            make.top.leading.equalTo(margin);
        }
        else {
            make.trailing.equalTo(-margin);
            make.bottom.equalTo(self.bottom).inset(margin);
        }
    }];
    
    [super updateConstraints];
}

- (void)remakeButtonAction {
    
    // 标记需要更新
    [self setNeedsUpdateConstraints];
    
    // 立即更新
    [self updateConstraintsIfNeeded];
    
    // 立即布局
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.isTop = true;
    // 标记需要更新
    [self setNeedsUpdateConstraints];
    // 立即更新
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];
}

@end

#pragma mark - 多个view 边距约束
@implementation MasonrymutltiEdgeView

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    return self;
}

// 使用updateConstraints 时必须实现 requiresConstraintBasedLayout并返回为YES
+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    UIView *lasView = self;
    for (NSInteger i = 0; i < 36; i++) {
        UIView *edgeView = [[UIView alloc] init];
        edgeView.layer.borderColor = [UIColor purpleColor].CGColor;
        edgeView.layer.borderWidth = 2.0;
        edgeView.backgroundColor = [UIColor cyanColor];
        [self addSubview:edgeView];
        
        [edgeView remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(lasView).insets(UIEdgeInsetsMake(10, 5, 5, 5));
        }];
        
        lasView = edgeView;
    }
    [super updateConstraints];
}

@end


#pragma mark -  宽高比
@implementation MasonryAutoFitView

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    [self setupUI];
    return self;
}


- (void)setupUI {
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor lightGrayColor];
    topView.layer.borderColor = UIColor.greenColor.CGColor;
    topView.layer.borderWidth = 3;
    
    UIView *topInnerView = [[UIView alloc] init];
    topInnerView.backgroundColor = [UIColor blueColor];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor grayColor];
    bottomView.layer.borderColor = UIColor.redColor.CGColor;
    bottomView.layer.borderWidth = 8;
    
    UIView *bottomInnerView = [[UIView alloc] init];
    bottomInnerView.backgroundColor = [UIColor magentaColor];
    
    [self addSubview:topView];
    [topView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
    }];
    
    [self addSubview:bottomView];
    [bottomView makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.top.equalTo(topView.bottom);
        make.height.equalTo(topView.height);
    }];
    
    [topView addSubview:topInnerView];
    [topInnerView makeConstraints:^(MASConstraintMaker *make) {
        // 设置自己的宽高比是3:1
        make.width.equalTo( topInnerView.height).multipliedBy(3); // 乘因数
       
        // 设置宽高并且设置他们的优先级最低
        make.width.height.lessThanOrEqualTo(topView);
        make.width.height.equalTo(topView).priorityLow();
        
        // 设置位置
        make.top.equalTo(topView);
    }];

    
    [bottomView addSubview:bottomInnerView];
    [bottomInnerView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(bottomInnerView.height).dividedBy(3); // 设置除因数
        make.width.height.lessThanOrEqualTo(bottomInnerView);
        make.width.height.equalTo(bottomView).priorityLow();
        make.center.equalTo(bottomView);
    }];
}


// 自定义的view 在以下方法中添加约束
+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    [super updateConstraints];
}



@end

#pragma mark - 多行文本
@interface MasonryMultiLabelView ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, assign) UIEdgeInsets edge;
@end

@implementation MasonryMultiLabelView

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    
    self.edge = UIEdgeInsetsMake(10, 10, 10, 10);
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 1;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor darkTextColor];
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    label.text = @"端午节";
    self.label = label;
    
    
    UILabel *label2 = [[UILabel alloc] init];
    self.label2 = label2;
    label2.numberOfLines = 0;
    label2.textColor = [UIColor cyanColor];
    label2.backgroundColor = [UIColor purpleColor];
    label2.lineBreakMode = NSLineBreakByTruncatingTail;
    label2.text = @"“五月五，是端阳。门插艾，香满堂。吃粽子，撒白糖，龙舟下水喜洋洋。”一曲儿歌唱罢，端午又至。现在大家对于端午节的认识就是三天假期，但父母们已经要开始面对孩子们的问题：什么是端午节呀？然后初为人父人母的答案自然是围绕着印象中的屈原、粽子、雄黄酒的故事展开，其实，这里面有个误解，那就是先有的端午节，而屈原的死只是恰好选择了这一天";
    
    [self addSubview:label2];
    [label2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).insets(_edge);
    }];
    
    
    // [使用lastBaseline属性crash解决办法](https://github.com/SnapKit/Masonry/issues/353)
    [self addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label2.lastBaseline);
        make.right.equalTo(self.right).insets(_edge);
    }];
    
    return self;
}

/// 在layouSubViews中设置文本的最大宽度后，
/// 需要 [self setNeedsLayout]方法，才会看到效果，
/// 不能调用[self layoutIfNeeded]; 因为调用之后就会接着调用 layoutSubviews 导致死循环
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = CGRectGetMinX(self.label.frame) - _edge.left;
//    width -= CGRectGetMinX(_label2.frame);
    _label2.preferredMaxLayoutWidth = width;
    [self setNeedsLayout];
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    
    // ...
    [super updateConstraints];
}
@end


#pragma mark - 多个控件使用数组约束
@interface MasonryArrayView ()
@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, strong) NSArray *buttons;
@end

@implementation MasonryArrayView

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    
    UIButton *raiseButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [raiseButton setTitle:@"👈" forState:UIControlStateNormal];
    [raiseButton addTarget:self action:@selector(raiseAction) forControlEvents:UIControlEventTouchUpInside];
    raiseButton.backgroundColor = [UIColor greenColor];
    [self addSubview:raiseButton];
    
    UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [centerButton setTitle:@"😇😇😇😂中心😂😄😇" forState:UIControlStateNormal];
    [centerButton addTarget:self action:@selector(centerAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:centerButton];
    [centerButton setBackgroundColor:[UIColor redColor]];
    
    UIButton *lowerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [lowerButton setTitle:@"👉" forState:UIControlStateNormal];
    [lowerButton addTarget:self action:@selector(lowerAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:lowerButton];
    [lowerButton setBackgroundColor:[UIColor purpleColor]];
    
    [lowerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10.0);
    }];
    
    [centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
    }];
    
    [raiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-10);
    }];
    
    self.buttons = @[ raiseButton, lowerButton, centerButton ];
    
    return self;
}


+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    
    [self.buttons updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(self.offset);
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
    }];
    
    [super updateConstraints];
}

- (void)centerAction {
    self.offset = 0.0;
    [self updateConstraints];
}

- (void)raiseAction {
    self.offset -= 30;
}

- (void)lowerAction {
    self.offset += 30;
//    [self updateConstraints];
    
//    [self setNeedsUpdateConstraints];
//    [self updateConstraintsIfNeeded];
}

- (void)setOffset:(CGFloat)offset {
    _offset = offset;
//     标记当前约束无效，下一次需要更新约束
    [self setNeedsUpdateConstraints];
//    立即更新约束， 如果不调用这个方法不会有动画效果
    [self updateConstraintsIfNeeded];
}

// 小结
/// updateConstraintsIfNeeded 不会触发调用updateConstraints 方法
/// 需要[self setNeedsUpdateConstraints]; [self updateConstraintsIfNeeded]; 两个方法才能调用 updateConstraints 方法

/// 获取可以直接手动调用 updateConstraints 方法

@end


#pragma mark -

@interface MasonryCollectView ()
@property (nonatomic, assign) NSInteger type;
@end
@implementation MasonryCollectView

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    self.type = 2;

    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _type = arc4random()%4;
    NSLog(@"type = %ld", _type);
    [self updateConstraints];
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    
    for (UIView *sub in self.subviews) {
        [sub removeFromSuperview];
    }
    
    NSMutableArray *arr = @[].mutableCopy;
    for (int i = 0; i < 4; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        view.layer.borderColor = [self randomColor].CGColor;
        view.layer.borderWidth = 5;
        [self addSubview:view];
        [arr addObject:view];
    }
    
    switch (_type) {
        case 0:
            [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:5 tailSpacing:5];
            [arr makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@60);
                make.height.equalTo(@60);
            }];
            break;
        case 1:
            [arr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:10 leadSpacing:20 tailSpacing:5];
            [arr makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@10);
                make.width.equalTo(@60);
            }];
            break;
        case 2:
            [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:200 leadSpacing:0 tailSpacing:0];
            [arr makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@60);
                make.height.equalTo(@60);
            }];
            break;
        case 3:
            [arr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedItemLength:30 leadSpacing:30 tailSpacing:200];
            [arr makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@0);
                make.width.equalTo(@60);
            }];
            break;
            
        default:
            break;
    }
    
    [super updateConstraints];
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end


#pragma mark - MasonryAnimationView

@implementation MasonryAnimationView
- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    return self;
}


+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    
    
    [super updateConstraints];
}
@end

#pragma mark - MasonryBatchView

@implementation MasonryBatchView
- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self addSubview:redView];
    
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self addSubview:yellowView];
    
    NSValue *sizeValue = [NSValue valueWithCGSize:CGSizeMake(100, 100)];
    /*
    [@[blueView, redView, yellowView] makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(sizeValue);
    }];
    
    [@[blueView, redView, yellowView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).inset(20);
    }];
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).inset(20);
    }];
     
     */
    
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(blueView.right).inset(10);
    }];
    
    [yellowView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(redView.right).inset(10);
    }];
    
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self);
        make.size.equalTo(@[redView, yellowView, sizeValue]);
    }];
    
    return self;
}


+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    
    
    [super updateConstraints];
}
@end


#pragma mark - MasonryiPhoneXView

@implementation MasonryiPhoneXView
- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    
    UIView *view = UIView.new;
    view.backgroundColor = UIColor.greenColor;
    view.layer.borderColor = UIColor.redColor.CGColor;
    view.layer.borderWidth = 2;
    [self addSubview:view];
    
    
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.mas_safeAreaLayoutGuideBottom);
        } else {
            // Fallback on earlier versions
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }
    }];
    
    return self;
}


+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    
    
    [super updateConstraints];
}
@end


