//
//  TextFieldCell.m
//  LoginOC
//
//  Created by yhp on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "TextFieldCell.h"

@interface TextFieldCell ()
@property(nonatomic, strong, readwrite) UITextField *textField;
@end


@implementation TextFieldCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}


- (void)setInputText:(NSString *)inputText {
    self.textField.text = inputText;
}

- (void)setupUI {
    [self.contentView addSubview:self.textField];
    
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.textField.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:80].active = YES;
    [self.textField.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:15].active = YES;
//    [self.textField.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    [self.textField.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-15].active = YES;
    
    [self.textField.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-15].active = YES;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _textField;
}


- (NSString *)inputText {
    return self.textField.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
