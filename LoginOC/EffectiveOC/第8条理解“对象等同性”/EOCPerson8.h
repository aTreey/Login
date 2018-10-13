//
//  EOCPerson8.h
//  
//
//  Created by HongpengYu on 2018/10/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EOCPerson8 : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, assign) NSUInteger identifier; // 唯一标识符（数据库主键）只需判断两个标识符是否相同就可以得知是否同一个对象

- (void)methond;
- (void)methond4;
@end

NS_ASSUME_NONNULL_END
