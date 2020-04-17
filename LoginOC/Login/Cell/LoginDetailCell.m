//
//  LoginDetailCell.m
//  LoginOC
//
//  Created by yhp on 2018/3/28.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LoginDetailCell.h"
#import "UIView+Category.h"
#import "LoginButtonCell.h"


@interface LoginDetailCell () <LoginCellButtonActionable>

@property (nonatomic, strong) UIButton *forgetPwdButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation LoginDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    [self.contentView addSubview:self.forgetPwdButton];
    [self.contentView addSubview:self.registerButton];
    [self.contentView addSubview:self.detailLabel];
    
    UILayoutGuide *view_guide = [[UILayoutGuide alloc] init];
    [self.contentView addLayoutGuide:view_guide];
    
    [self.forgetPwdButton.topAnchor constraintEqualToAnchor:view_guide.topAnchor constant:10].active = YES;
    [self.forgetPwdButton.leftAnchor constraintEqualToAnchor:view_guide.leftAnchor constant:15].active = YES;

    [self.registerButton.topAnchor constraintEqualToAnchor:self.forgetPwdButton.topAnchor].active = YES;
    [self.registerButton.rightAnchor constraintEqualToAnchor:view_guide.rightAnchor constant:-15].active = YES;

    [self.detailLabel.leftAnchor constraintEqualToAnchor:self.forgetPwdButton.leftAnchor].active = YES;
    [self.detailLabel.topAnchor constraintEqualToAnchor:self.forgetPwdButton.bottomAnchor constant:20].active = YES;
//    [self.detailLabel.bottomAnchor constraintGreaterThanOrEqualToAnchor:view_guide.bottomAnchor constant:-20].active = YES;

    [view_guide.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [view_guide.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [view_guide.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    [view_guide.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    NSLayoutConstraint *heightConstraint = [view_guide.heightAnchor constraintEqualToConstant:100];
    heightConstraint.priority = 999;
    heightConstraint.active = YES;
}

- (void)updateWithCellModel:(id)cellModel {
    [self.forgetPwdButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [self.forgetPwdButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [self.registerButton setTitle:@"新用户注册" forState:UIControlStateNormal];

    self.detailLabel.text = @"非中国大陆手机号码请在号码前输入00开头国家/地区代码\n例如: 美国001";
//    [self.registerButton setBackgroundColor:[UIColor blueColor]];
//    [self.forgetPwdButton setBackgroundColor:[UIColor redColor]];
//    self.detailLabel.backgroundColor = [UIColor cyanColor];
}


- (UIButton *)forgetPwdButton {
    if (!_forgetPwdButton) {
        _forgetPwdButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetPwdButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_forgetPwdButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_forgetPwdButton addTarget:self.viewController action:@selector(cellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPwdButton;
}


- (UIButton *)registerButton {
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_registerButton addTarget:self.viewController action:@selector(cellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _detailLabel.numberOfLines = 2;
        _detailLabel.textColor = [UIColor darkGrayColor];
        _detailLabel.font = [UIFont systemFontOfSize:14];
    }
    return _detailLabel;
}

- (void)cellButtonAction:(UIButton *)sender {
    
}


@end
