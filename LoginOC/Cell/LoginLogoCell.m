//
//  LoginLogoCell.m
//  LoginOC
//
//  Created by liepin on 2018/3/23.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LoginLogoCell.h"
#import "LoginLogoCellModel.h"

@interface LoginLogoCell ()

@property (nonatomic, strong) UIImageView *logoImageView;
@end

@implementation LoginLogoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.logoImageView];
        
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = NO;
        UILayoutGuide *view_guide = [[UILayoutGuide alloc] init];
        
        [self.contentView addLayoutGuide:view_guide];
        [self.logoImageView.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
        [self.logoImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
    }
    return self;
}

- (void)updateWithCellModel:(LoginLogoCellModel *)cellModel {
    self.logoImageView.image = [UIImage imageNamed:cellModel.logoImageName];
}

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc] init];
    }
    return _logoImageView;
}


@end
