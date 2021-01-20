//
//  LBDropMenuCell.h
//  LoginOC
//
//  Created by yhp on 2018/4/8.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GrowupResponse.h"


static NSString *const DropMenuCell = @"DropMenuCell";

typedef void(^SelectButtonClickBlock)(BOOL isSelected);


@interface LBDropMenuCell : UITableViewCell
//@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) CourseJsonTreeDataResponse *data;

@property (nonatomic, copy) SelectButtonClickBlock buttonClickBlock;

@end
