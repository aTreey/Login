//
//  LoginTitleCell.m
//  LoginOC
//
//  Created by liepin on 2018/3/23.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LoginTitleCell.h"
#import "LoginTitleCellModel.h"

@interface LoginTitleCell ()
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LoginTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        
        [self layoutMarginsGuide_test];
//        [self layoutGuide_test];
    }
    return self;
}


//// 某些时候使用 view 的layoutMarginsGuide 更加的方便,因为有宽度和高度
- (void)layoutMarginsGuide_test {
    // 使用view 的layoutMarginsGuide 属性时 会有宽为8 像素的边距
    UILayoutGuide *view_guide = self.contentView.layoutMarginsGuide;
    [self.contentView addLayoutGuide:view_guide];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.titleLabel.centerXAnchor constraintEqualToAnchor:view_guide.centerXAnchor].active = YES;
    [self.titleLabel.centerYAnchor constraintEqualToAnchor:view_guide.centerYAnchor].active = YES;
    NSLayoutConstraint *heightConstraint = [view_guide.heightAnchor constraintEqualToConstant:100];
    heightConstraint.priority = 999; // 设置优先级
    heightConstraint.active = YES;
}

///// UILayoutGuide 一般可以用作空间的容器或者是间距时的时候较为方便，
- (void)layoutGuide_test {
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;

    UILayoutGuide *view_guide = [[UILayoutGuide alloc] init];
    [self.contentView addLayoutGuide:view_guide];
//    1.
    [view_guide.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [view_guide.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    [view_guide.heightAnchor constraintEqualToAnchor:self.titleLabel.heightAnchor].active = YES;
    // UIlabel、UITextView、有内建高度直接设置他的底部相等就可以将cell 撑高
    [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
    
    // 2. 设置layouGuide 高度 （不能达到目的）
//    [view_guide.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
//    [view_guide.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
//    [view_guide.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
//    [view_guide.heightAnchor constraintEqualToConstant:200].active = YES;
//    [self.titleLabel.centerXAnchor constraintEqualToAnchor:view_guide.centerXAnchor].active = YES;
//    [self.titleLabel.centerYAnchor constraintEqualToAnchor:view_guide.centerYAnchor].active = YES;
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}

- (void)updateWithCellModel:(LoginTitleCellModel *)cellModel {
    self.titleLabel.text = cellModel.title;
}


@end
