//
//  FormBaseCell.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/20.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormRowProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface FormBaseCell : UITableViewCell <FormRowProtocol>

@property (nonatomic, weak) FormRow *rowDescriptor;

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, assign) CGFloat rightLabelRightMargin;
@property (nonatomic, assign) CGFloat leftLabelLeftMargin;


- (void)initSubViews;

@end

NS_ASSUME_NONNULL_END
