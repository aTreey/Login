//
//  TextFieldCell.h
//  LoginOC
//
//  Created by liepin on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextFieldCell : UITableViewCell

@property(nonatomic, strong, readonly) UITextField *textField;
@property(nonatomic, strong) NSString *inputText;

@end
