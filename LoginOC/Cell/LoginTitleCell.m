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
        
        [self setupUI1];
//        [self setupUI2];
    }
    return self;
}

- (void)setupUI1 {
    UILayoutGuide *view_guide = self.contentView.layoutMarginsGuide;
    [self.contentView addLayoutGuide:view_guide];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *heightConstraint = [view_guide.heightAnchor constraintEqualToConstant:60];
    heightConstraint.priority = 999;
    heightConstraint.active = YES;
    
    [self.titleLabel.centerXAnchor constraintEqualToAnchor:view_guide.centerXAnchor].active = YES;
    [self.titleLabel.centerYAnchor constraintEqualToAnchor:view_guide.centerYAnchor].active = YES;
    //    [self.titleLabel.heightAnchor constraintEqualToConstant:60].active = YES;
}


- (void)setupUI2 {
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;

    UILayoutGuide *view_guide = [[UILayoutGuide alloc] init];
    [self.contentView addLayoutGuide:view_guide];
    [view_guide.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [view_guide.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    [view_guide.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [view_guide.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
//    [view_guide.heightAnchor constraintEqualToConstant:100].active = YES;
    
    [self.titleLabel.centerXAnchor constraintEqualToAnchor:view_guide.centerXAnchor].active = YES;
    [self.titleLabel.centerYAnchor constraintEqualToAnchor:view_guide.centerYAnchor].active = YES;
    [self.titleLabel.topAnchor constraintEqualToAnchor:view_guide.topAnchor].active = YES;
    [self.titleLabel.bottomAnchor constraintEqualToAnchor:view_guide.bottomAnchor].active = YES;
    [self.titleLabel.heightAnchor constraintEqualToConstant:100].active = YES;
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
