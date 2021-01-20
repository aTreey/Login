//
//  FormBaseController.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/19.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Form.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormBaseController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) Form *form;

@end

NS_ASSUME_NONNULL_END
