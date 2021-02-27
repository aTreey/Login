//
//  BuilderProtocol.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/4.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BuilderProtocol <NSObject>

@required

- (id)build;

@end

NS_ASSUME_NONNULL_END
