//
//  Person_Prototype.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/21.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person_Prototype : NSObject <NSCopying>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

+ (void)test;

@end

@interface Student_Prototype : Person_Prototype

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) CGSize size;

+ (void)test;

@end

// ========================================================================================================
//  ============ 为了 Student实现copyWithZone方法，然后重新把属性全部赋值一遍？这样不够优雅。框架级别的实现 =============
// ========================================================================================================

@interface BaseCopyObject : NSObject <NSCopying>

/// 由子类重载实现，复制（赋值操作）
/// @param object 子类对象
- (void)copyOperationWithObject:(id)object;

@end


@interface Person_Prototype1 : BaseCopyObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

+ (void)test;

@end


@interface Student_Prototype1 : Person_Prototype1

//注意属性中如果有类似Person、NSArray类型的属性，则需要注意：

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, strong) Person_Prototype1 *teacher;//注意Person_Prototype1是BaseCopyObject的子类
@property (nonatomic, copy) NSArray *friends;
@property (nonatomic, strong) NSMutableArray *girlfriends;

+ (void)test;

@end

NS_ASSUME_NONNULL_END
