//
//  LBDropMenuSingleCell.m
//  ios-lebanban-app
//
//  Created by liepin on 2018/4/9.
//  Copyright © 2018年 liepin. All rights reserved.
//

#import "LBDropMenuSingleCell.h"
#import "UIColor+Extension.h"

@interface LBDropMenuSingleCell ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LBDropMenuSingleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.scrollView.userInteractionEnabled = false;
        [self.contentView addGestureRecognizer:self.scrollView.panGestureRecognizer];
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

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
    [self.titleLabel sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.titleLabel.frame.size.width + 5, self.titleLabel.frame.size.height);
}

- (void)setupUI {
    [self.contentView addSubview:self.scrollView];
    [self.scrollView addSubview:self.titleLabel];
    
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:15].active = YES;
    [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:5].active = YES;
    [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-5].active = YES;
    [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-5].active = YES;
    
    
    [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0].active = YES;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = self.backgroundColor;
        _scrollView.bounces = false;
        _scrollView.showsVerticalScrollIndicator = false;
        _scrollView.contentSize = CGSizeMake(200, 20);
    }
    return _scrollView;
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    }
    return _titleLabel;
}


@end
