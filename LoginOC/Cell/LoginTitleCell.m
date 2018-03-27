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
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
        [self.titleLabel.widthAnchor constraintEqualToAnchor:self.contentView.widthAnchor].active = YES;
        [self.titleLabel.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor].active = YES;
    }
    return self;
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
