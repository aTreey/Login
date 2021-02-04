//
//  AbstractFactoryDemo.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/1.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "AbstractFactoryDemo.h"
#import "FactoryManager.h"


@implementation AbstractFactoryDemo

- (void)bussiness {
    BaseFactory *factory = [FactoryManager factoryWithType:FactoryTypeApple];
    
    BasePhone *phone = [factory creatPhone];
    BaseWatch *watch = [factory creatWatch];
    
    
    NSLog(@"AbstractFactoryDemo ====iPhone == %@, watch==== %@", phone, watch);
}

@end
