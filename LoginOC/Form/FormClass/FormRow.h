//
//  FormRow.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/19.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FormRow : NSObject

@property (nonatomic, assign, readonly) UITableViewCellStyle style;
@property (nonatomic, copy, readonly) NSString *reuseIdentifier;
@property (nonatomic, copy) NSString *noValueDisplayText;
@property (nonatomic, strong) Class cellClass;
@property (nonatomic, assign) CGFloat rowHeight;
@property (nonatomic, assign) BOOL hasTopSep;
@property (nonatomic, assign) BOOL hasBottomSep;
@property (nonatomic, assign, getter=isHidden) BOOL hidden;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end

NS_ASSUME_NONNULL_END
