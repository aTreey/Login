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
#import <UIColor+Extension.h>

typedef void(^MyBlock)(NSInteger a, NSInteger b);

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *scrollContentView;

@property (nonatomic, strong) UIScrollView *scrollView2;
@property (nonatomic, strong) UIView *scrollContentView2;

@property (nonatomic, strong) NSTimer *timer;

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
    
//    [self loginModule];
//
//    [self dropMenuView];
    
//    [self testBlock];
//
//    [self gcdTest];
//    [self anaylsisHTML];
    
    [self testScrollView];
//    [self horizontalScrollView];
    [self fetchVehicleStatus];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSInteger random = (arc4random() % 101);
    NSLog(@"=====%ld", random);
    [self dispatch_semaphore_t:random];
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

#pragma mark - 信号量

- (void)dispatch_semaphore_t:(NSInteger)number {
    
    NSLog(@"dispatch_semaphore_t测试");
    dispatch_semaphore_t single = dispatch_semaphore_create(0);
    NSLog(@"single1111 = %@", single);
    if (number > 50) {
        NSLog(@"single2222 = %@", single);
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            for (NSInteger i = 0; i <= 100; i++) {
                NSLog(@"异步执行");
            }
            dispatch_semaphore_signal(single);
            NSLog(@"single3333 = %@", single);
        });
    } else {
        dispatch_semaphore_signal(single);
        NSLog(@"single4444 = %@", single);
    }
    
    dispatch_semaphore_wait(single, DISPATCH_TIME_FOREVER);
    NSLog(@"2222222----222");
//    dispatch_semaphore_signal(single);
    NSLog(@"single5555 = %@", single);

}

- (void)testScrollView {
    self.scrollView = [UIScrollView new];
    self.scrollContentView = [UIView  new];
    
    self.scrollView2 = [UIScrollView new];
    self.scrollContentView2 = [UIView  new];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.scrollContentView];
    
//    [self.view addSubview:self.scrollView2];
//    [self.scrollView addSubview:self.scrollContentView2];
    
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(200, 0, 100, 0));
    }];
    
    [self.scrollContentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.height.equalTo(self.scrollView);
    }];
    
    UILabel *testLable = [UILabel new];
    UILabel *testLable2 = [UILabel new];
    
    testLable.text = [NSString stringWithFormat:@"第1111个"];
    testLable.textAlignment = NSTextAlignmentCenter;
    testLable.backgroundColor = [UIColor blueColor];
    
    testLable2.text = [NSString stringWithFormat:@"第2222个"];
    testLable2.textAlignment = NSTextAlignmentCenter;
    testLable2.backgroundColor = [UIColor redColor];

    
    [self.scrollView addSubview:testLable];
    
    [testLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.width.equalTo(self.view);
        make.leading.mas_equalTo(0);
        make.bottom.equalTo(self.view);
    }];
    
    [self.scrollView addSubview:testLable2];
    [testLable2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.width.equalTo(self.view);
        make.leading.equalTo(testLable.mas_trailing);
        make.bottom.equalTo(self.view);
    }];
    
    [self.scrollContentView makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(testLable2.trailing);
    }];
}


- (void)horizontalScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
    
    [scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(10, 5, 10, 5));
    }];
    
    
    // 需要创建一个容器，存放创建的子控件
    UIView *containerView = [[UIView alloc] init];
    [scrollView addSubview:containerView];
    
    [containerView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.height.equalTo(scrollView);
    }];
    
    UILabel *lastLabel = nil;
    for (NSInteger i = 0; i < 30; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:@"第%ld个", i];
        label.textAlignment = NSTextAlignmentCenter;
//        label.backgroundColor = [self randomColor];
        
        [scrollView addSubview:label];
        
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.width.equalTo(self.view);
            make.leading.equalTo(lastLabel ? lastLabel.trailing : @0);
            make.bottom.equalTo(self.view);
        }];
        lastLabel = label;
    }
    
    [containerView makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(lastLabel.trailing);
    }];
}

- (void)fetchVehicleStatus {
    [self startTimer];
    NSLog(@"time ========= %@", [NSDate date]);

}

- (void)startTimer {
    [_timer invalidate];
    _timer = [NSTimer timerWithTimeInterval:5
                                     target:self
                                   selector:@selector(fetchVehicleStatus)
                                   userInfo:nil
                                    repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)endTimer {
    [_timer invalidate];
    _timer = nil;
}

@end
