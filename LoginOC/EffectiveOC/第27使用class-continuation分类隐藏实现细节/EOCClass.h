//
//  EOCClass.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EOCSuperSecretClass;

/// 拥有者绝密类（EOCSuperSecretClass）实例的某个类
@interface EOCClass : NSObject

// 实例变量声明在公共接口中, 信息就会暴露
/// 解决方法:
/// 1.使用 id 代替 EOCSuperSecretClass * 这样做不够好，无法得到编译器的帮助

{
    @private
    EOCSuperSecretClass *_secretInstance;
    
}

@end
