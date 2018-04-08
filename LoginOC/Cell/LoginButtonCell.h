//
//  LoginButtonCell.h
//  LoginOC
//
//  Created by liepin on 2018/3/27.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginItem.h"

// 为方便代码阅读增加协议
@protocol LoginCellButtonActionable <NSObject>
- (void)cellButtonAction:(UIButton *)sender;
@end

@interface LoginButtonCell : UITableViewCell <CellUpdatable>

@end
