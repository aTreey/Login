//
//  LBDropMenuCell.m
//  LoginOC
//
//  Created by yhp on 2018/4/8.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LBDropMenuCell.h"

#import "UIColor+Extension.h"


@interface LBDropMenuCell ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) UILabel *titleLabel;



@end

@implementation LBDropMenuCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.scrollView.userInteractionEnabled = false;
        [self.contentView addGestureRecognizer:self.scrollView.panGestureRecognizer];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.selectedBackgroundView = [[UIView alloc] init];

        [self setupUI];
    }
    return self;
}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#EF8200"];
        self.selectedBackgroundView.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
    } else {
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        self.selectedBackgroundView.backgroundColor = self.backgroundColor;
    }
}

- (void)selectButtonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.buttonClickBlock) {
        self.buttonClickBlock(sender.selected);
    }
}



- (void)setData:(CourseJsonTreeDataResponse *)data {
    _data = data;
    self.titleLabel.text = data.name;
    
    if (data.isSelect) {
        self.titleLabel.textColor = [UIColor redColor];
        self.selectButton.selected = YES;
    } else {
        self.selectButton.backgroundColor = [UIColor whiteColor];
        self.selectButton.selected = NO;

    }
}



//- (void)setTitle:(NSString *)title {
//    _title = title;
//    self.titleLabel.text = title;
//    [self.titleLabel sizeToFit];
//    self.scrollView.contentSize = CGSizeMake(self.titleLabel.frame.size.width + 30, self.titleLabel.frame.size.height);
//}

- (void)setupUI {
    [self.contentView addSubview:self.selectButton];
    [self.contentView addSubview:self.scrollView];
    [self.scrollView addSubview:self.titleLabel];
    
    self.selectButton.translatesAutoresizingMaskIntoConstraints = false;
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;

    [NSLayoutConstraint constraintWithItem:self.selectButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:15].active = YES;
    [NSLayoutConstraint constraintWithItem:self.selectButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.selectButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:20].active = YES;
    [NSLayoutConstraint constraintWithItem:self.selectButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:20].active = YES;
    
    
    [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.selectButton attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:5].active = YES;
    [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:5].active = YES;
    [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-5].active = YES;
    [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-5].active = YES;


    [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:5].active = YES;
    [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0].active = YES;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.bounces = false;
        _scrollView.showsVerticalScrollIndicator = false;
        _scrollView.contentSize = CGSizeMake(200, 20);
    }
    return _scrollView;
}

- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectButton setImage:[UIImage imageNamed:@"defaultAppIcon"] forState:UIControlStateSelected];
        [_selectButton setImage:[UIImage imageNamed:@"downarr"] forState:UIControlStateNormal];
        
        _selectButton.backgroundColor = [UIColor whiteColor];
        [_selectButton addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor darkTextColor];
    }
    return _titleLabel;
}

@end
