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
#import "Person_Prototype.h"
#import "MySingleton.h"


typedef void(^MyBlock)(NSInteger a, NSInteger b);

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *scrollContentView;

@property (nonatomic, strong) UIScrollView *scrollView2;
@property (nonatomic, strong) UIView *scrollContentView2;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UILabel *htmlLabel;

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@property (nonatomic, strong) UIView *view4;

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
    //    [self fetchVehicleStatus];
    
    [self designPatters];
    
    [self cornerradiusAndShadow];
    
    [self testComponents];
    
    [self testSingleton];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSInteger random = (arc4random() % 101);
    NSLog(@"=====%ld", random);
    //    [self dispatch_semaphore_t:random];
//    [self webService];
}

- (void)viewDidLayoutSubviews {
    
//    self.view1.layer.shadowColor = [UIColor redColor].CGColor;
//    self.view1.layer.shadowOffset =  CGSizeMake(0, 5);
//    self.view1.layer.shadowOpacity = 1;
    
    CALayer *subLayer=[self.view2 layer];
    subLayer.shadowColor = [UIColor redColor].CGColor;
    subLayer.shadowOffset = CGSizeMake(5,8);
    subLayer.shadowOpacity = 1;
//
//    [self.view1.layer insertSublayer:subLayer atIndex:0];
    
}

- (void)cornerradiusAndShadow {
    UIView *view1 = [UIView new];
    self.view1 = view1;
    UIView *view2 = [UIView new];
    self.view2 = view2;
    UIView *view3 = [UIView new];
    self.view3 = view3;
    UIView *view4 = [UIView new];
    self.view4 = view4;
    
        
    [self.view addSubview:view1];
    [self.view1 addSubview:view3];
    [self.view1 addSubview:view2];
    [self.view1 addSubview:view4];
    
    view1.layer.cornerRadius = 10;
    view1.layer.masksToBounds = YES;
    
    view1.backgroundColor = [UIColor cyanColor];
    view2.backgroundColor = [UIColor blueColor];
    view3.backgroundColor = [UIColor clearColor];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view1);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 80));
    }];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view2.mas_bottom);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 70));
    }];
    
    
//    view1.layer.shadowColor = [UIColor redColor].CGColor;
//    view1.layer.shadowOffset =  CGSizeMake(0, 5);
//    view1.layer.shadowOpacity = 1;
    
    
    
//    [view1.layer insertSublayer:subLayer below:view2.layer];
}

- (void)setupHtmlLabel {
    self.htmlLabel = [UILabel new];
    
}

- (void)designPatters {
    [Person_Prototype test];
    [Student_Prototype test];
    [Person_Prototype1 test];
    [Student_Prototype1 test];
}

- (void)webService {
    NSURL *url = [NSURL URLWithString:@"http://192.168.74.233:8888/api/fe/list"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error && data) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"response = %@", dict);
        }
    }] resume];
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
        make.top.mas_equalTo(self.mas_topLayoutGuideBottom);
        make.leading.trailing.equalTo(self.view);
        make.height.mas_equalTo(80);
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
        make.bottom.equalTo(self.scrollContentView);
    }];
    
    [self.scrollView addSubview:testLable2];
    [testLable2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.width.equalTo(self.view);
        make.leading.equalTo(testLable.mas_trailing);
        make.bottom.equalTo(self.scrollContentView);
    }];
    
    [self.scrollContentView makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(testLable2.trailing);
    }];
}


- (void)horizontalScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor grayColor];
    scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
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

- (void)testComponents {
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:@""];
    [components.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"---");
    }];
}

- (void)testSingleton {
    Singleton *singleton = [Singleton sharedInstance];
    Singleton *mySingleton = [MySingleton sharedInstance];
    
    NSLog(@"singleton ---- %@", singleton);
    NSLog(@"my singleton ---- %@", mySingleton);
}

@end
