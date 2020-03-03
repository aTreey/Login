//
//  BrandingFactory.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/2.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "BrandingFactory.h"

@implementation BrandingFactory

+ (BrandingFactory *)factory {
    
#if defined (USE_ACME)
    return [[[AcmeBrandingFactory alloc] init] autorelease];
#elif defined (USE_SIERRA)
    return [[[SierraBrandingFactory alloc] init] autorelease];
#else
    return nil;
#endif
}

- (UIView *)brandedView { return nil; }

- (UIButton *)brandedMainButton { return nil; }

- (UIToolbar *)brandedToolbar { return nil; }

@end
