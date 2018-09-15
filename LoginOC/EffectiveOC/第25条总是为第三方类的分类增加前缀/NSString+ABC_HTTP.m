//
//  NSString+ABC_HTTP.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "NSString+ABC_HTTP.h"

@implementation NSString (ABC_HTTP)

@end


////////////////////// 结论 /////////////

/// 向第三方类中添加s分类时，总是应该给其名称加上你的专用前缀
/// 向第三方类中添加s分类时，总是应该给其中的方法名加上你的专用前缀

/// 原因：
/// 分类的方法是在运行期系统直接添加在类中的，会把分类中实现的每个方法都加入类的方法列表中
/// 不使用前缀存在的问题：
/// 1. 如果方法名相同，分类中的方法会覆盖类中本身实现的d方法
/// 2. 如果存在多个分类，并且增加的方法名也相同，会多次覆盖，结果以最后一个为准
/// 3. 出现bug后不容易调试

