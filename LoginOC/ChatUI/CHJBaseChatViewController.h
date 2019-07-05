//
//  CHJBaseChatViewController.h
//  LoginOC
//
//  Created by YuHongpeng on 2019/6/5.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHJBaseChatViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

/// 消息列表
@property (nonatomic, weak) UITableView *tableView;
/// 消息列表样式
@property (nonatomic, assign) UITableViewStyle tableViewStyle;

/// 消息数据
@property (nonatomic, strong) NSMutableArray *dataSource;


/**
 加载消息数据
 */
- (void)loadDataSource;
@end

NS_ASSUME_NONNULL_END
