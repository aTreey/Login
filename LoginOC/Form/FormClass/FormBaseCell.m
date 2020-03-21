//
//  FormBaseCell.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/20.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "FormBaseCell.h"

@implementation FormBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubViews];
        [self updateConstraintsIfNeeded];
    }
    
    return self;
}

- (void)updateConstraints {
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(self.contentView).inset(self.rightLabelRightMargin);
    }];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.leading.mas_equalTo(self.contentView).inset(self.leftLabelLeftMargin);
    }];
    
    [super updateConstraints];
}

- (void)initSubViews {
    self.rightLabelRightMargin = 15;
    self.leftLabelLeftMargin = 15;
    [self.contentView addSubview:self.leftLabel];
    [self.contentView addSubview:self.rightLabel];
}

- (UILabel *)leftLabel {
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _leftLabel;
}

- (UILabel *)rightLabel {
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.textAlignment = NSTextAlignmentRight;
    }
    return _rightLabel;
}

- (void)update {
    NSLog(@"FormBaseCell -- update");
}

@end
