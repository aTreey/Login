//
//  Blocks1.m
//  LoginOC
//
//  Created by HongpengYu on 2019/3/14.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "Blocks1.h"

@interface Blocks1 ()
@property (assign) int buttonId;
@end

@implementation Blocks1

int buttonId = 0;
void buttonCallBack(int event) {
    printf("buttonId == %d, event = %d\n", buttonId, event);
}
- (void)test {

}

- (instancetype)initWithButtonId: (int)buttonId {
    self = [super init];
    self.buttonId = buttonId;
    return self;
}

- (void)callback:(int)event {
    NSLog(@"buttonId == %d, event = %d\n", _buttonId, event);
}


void setButtonCallbacksUsingObject(id objc, Blocks1 *blocObjc) {
    NSLog(@"buttonId == %d, event = %d\n", objc, blocObjc);
}



//void setButtonCallbacksUsingBlock(id objc, ^void (int event)) {
//    NSLog(@"buttonId == %d, event = %d\n", objc);
//}



// 对象持有了每一个buttonID 所以
void setButtonCallbacks() {
    for (int i = 0; i < 1000; ++i) {
        Blocks1 *objc = [[Blocks1 alloc] initWithButtonId:i];
        NSObject *Id = [[NSObject alloc] init];
        setButtonCallbacksUsingObject(Id, objc);
        
//        setButtonCallbacksUsingBlock(Id, ^(int event)) {
//
//        }
    }
}

#pragma 2.2.1 C 语言 block 语法

//^(int event) {  }
//
//^void (int event) {  }

// OC block 语法
//^ 返回值类型  参数列表  表达式
//^int (int count) {
//    return count + 1;
//}



/*
* 无参数 block
*/
//^void (void) { printf("Blocks\n");}

// 无返回值
//^{ printf("Blocks\n"); }


#pragma 2.2.2 Block 变量类型

//int (^block)


@end
