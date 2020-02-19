//
//  HorizontalTwoLabel.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/27.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "HorizontalTwoLabel.h"

@implementation HorizontalTwoLabel

- (IBAction)textChangeAction:(UIStepper *)sender {
    switch (sender.tag) {
        case 0:
            self.titleLabel.text = [self getLabelContentWithCount:(NSUInteger)sender.value];
            break;

        case 1:
            self.valueLabel.text = [self getLabelContentWithCount:(NSUInteger)sender.value];
            break;

        default:
            break;
    }
}

#pragma mark - Private

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"========init");
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        NSLog(@"=========initWithFrame");
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        NSLog(@"=========initWithCoder");
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupView];
    NSLog(@"=========awakeFromNib");
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setupView {
    self.titleLabel = [UILabel new];
    self.titleLabel.backgroundColor = [UIColor yellowColor];
    self.titleLabel.text = @"title";

    self.valueLabel = [UILabel new];
    self.valueLabel.backgroundColor = [UIColor greenColor];
    self.valueLabel.text = @"value可被拉伸";
    self.valueLabel.textAlignment = NSTextAlignmentRight;
    
    [self.containerView addSubview:self.titleLabel];
    [self.containerView addSubview:self.valueLabel];
}

- (void)updateConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.containerView).inset(0);
        make.left.mas_equalTo(self.containerView).inset(5);
    }];
    
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.containerView).inset(10);
        make.left.mas_equalTo(self.titleLabel.mas_right).inset(10).priorityLow();
        make.right.mas_lessThanOrEqualTo(self.containerView).inset(5).priorityHigh();
    }];
    
    // Content Compression Resistance = 不许挤我,这个属性的优先级（Priority）越高，越不“容易”被压缩。也就是说，当整体的空间装不下所有的View的时候，Content Compression Resistance优先级越高的，显示的内容越完整
    
    // Content Hugging = 抱紧, 优先级越高，整个View就要越“抱紧”View里面的内容。也就是View的大小不会随着父级View的扩大而扩大
    
    [self.titleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.valueLabel setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self.valueLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    
    [super updateConstraints];
}

- (NSString *)getLabelContentWithCount:(NSUInteger)count {
    NSMutableString *ret = [NSMutableString new];

    for (NSUInteger i = 0; i <= count; i++) {
        [ret appendString:@"label,"];
    }

    return ret.copy;
}

@end
