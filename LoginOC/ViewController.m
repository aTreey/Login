//
//  ViewController.m
//  LoginOC
//
//  Created by liepin on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "ViewController.h"
#import "LoginController.h"
#import "LiveController.h"
#import "UIViewController+LayoutGuide.h"

typedef void(^MyBlock)(NSInteger a, NSInteger b);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test];
    
//    [self spaceTest];
//
//    [self containerCenter];
//
//    [self testAutoresizingMask];
    
//    [self suspendPlayVido];
    
    [self loginModule];
    
    [self dropMenuView];
    
//    [self testBlock];
//
//    [self gcdTest];
//    [self anaylsisHTML];
}


- (void)testBlock {
    __block int value = 1024;
    MyBlock block = ^(NSInteger a, NSInteger b) {
        b = a + value;
        NSLog(@"b = %d", b);
        
        value += b;
        NSLog(@"value = %d", value);
    };
    
    value = 2048;
    
    block(1,0);
}


- (void)gcdTest {
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_queue_t globleQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(globleQueue, ^{
        NSLog(@"mainqueue");
    });
    
    NSLog(@"next task");
}

// 视屏播放
- (void)tapAction {
    LiveController *liveVC = [LiveController new];
    [self.navigationController pushViewController:liveVC animated:true];
}


- (void)testButtonAction {
    LoginController *loginController = [LoginController new];
    [self.navigationController pushViewController:loginController animated:YES];
}


- (void)anaylsisHTML {
    NSString *patternStr = @"(?<=title>).*(?=</title)";
    NSString *urlString = @"https://www.jianshu.com/p/fe6929df6b05";
    NSString *html = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:nil];
    
    
    
    NSRange range = [html rangeOfString:patternStr options:NSRegularExpressionSearch];
    
    NSString *result = [html substringWithRange:range];
    NSLog(@"%@", result);
    
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:patternStr options:0 error:&error];
    
    if (regex != nil) {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:html options:0 range:NSMakeRange(0, [urlString length])];
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            
            //从urlString当中截取数据
            NSString *result=[urlString substringWithRange:resultRange];
            //输出结果
            NSLog(@"->%@<-",result);
        }
    }
}


@end
