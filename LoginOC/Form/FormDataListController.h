//
//  FormDataListController.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/21.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FormDataListController : UITableViewController

@property (nullable, nonatomic, copy) void(^selectBlock)(id model);

@end

NS_ASSUME_NONNULL_END
