//
//  LoginButtonCell.m
//  LoginOC
//
//  Created by liepin on 2018/3/27.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LoginButtonCell.h"
#import "LoginButtonCellModel.h"
#import "UIView+Category.h"

@interface LoginButtonCell ()
@property (nonatomic, strong) UIButton *loginButton;
@end


@implementation LoginButtonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.loginButton];
        UILayoutGuide *view_guide = [[UILayoutGuide alloc] init];
        [self.contentView addLayoutGuide:view_guide];
        [self.loginButton.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
        [self.loginButton.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
        [self.loginButton.leadingAnchor constraintEqualToAnchor:view_guide.leadingAnchor constant:15].active = YES;
        [self.loginButton.trailingAnchor constraintEqualToAnchor:view_guide.trailingAnchor constant:-15].active = YES;
        
        [view_guide.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
        [view_guide.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    }
    return self;
}


- (void)updateWithCellModel:(LoginButtonCellModel *)cellModel {
    [self.loginButton setTitle:cellModel.title forState:UIControlStateNormal];
    [self.loginButton setTitleColor:cellModel.titleColor forState:UIControlStateNormal];
    [self.loginButton setBackgroundColor:cellModel.backgroundColor];
    self.loginButton.layer.cornerRadius = cellModel.cornerRadius;
    [self.loginButton.heightAnchor constraintEqualToConstant:cellModel.height].active = YES;
}


- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.layer.masksToBounds = true;
        _loginButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_loginButton addTarget:self.viewController action:@selector(cellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}


@end
