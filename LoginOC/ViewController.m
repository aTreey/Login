//
//  ViewController.m
//  LoginOC
//
//  Created by yhp on 2018/3/22.
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

/**
 使用strong修饰NSString 有什么问题
 */
@property (nonatomic, strong) NSString *strongString;
@property (nonatomic,   copy) NSString *stringCopy;


/**
 使用copy修饰 NSMutableString，会崩溃
 */
@property (nonatomic, copy) NSMutableString *mutableStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self test];
    
    //    [self spaceTest];
    //
    //    [self containerCenter];
    //
//        [self testAutoresizingMask];
    [self testString_description];
    
    //    [self suspendPlayVido];
    
    //    [self loginModule];
    //
    //    [self dropMenuView];
    
    //    [self testBlock];
    //
    //    [self gcdTest];
    //    [self anaylsisHTML];
    
//    [self testScrollView];
    //    [self horizontalScrollView];
    //    [self fetchVehicleStatus];
    
//    [self designPatters];
//
//    [self cornerradiusAndShadow];
//
//    [self testComponents];
//
//    [self testSingleton];
    
    [self iOSInterview];
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

- (void)testString_description {
    NSMutableDictionary *dict = [@{@"key1": @"value1", @"key2": @[@"1", @"2"], @"key3": @[@1, @2]} mutableCopy];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key === %@",key);
        NSLog(@"value ==== %@", obj);
        NSLog(@"value description ==== %@", [obj description]);
        NSString *str = [NSString stringWithFormat:@"%@", [key description]];
        NSLog(@"str ==== %@", str);
    }];
}


///---------------- iOS 面试之道 -------------------------

- (void)iOSInterview {
    [self iOSGrammer];
}

- (void)iOSGrammer {
    
    /**
     NSString 使用copy和strong修饰的区别
     self.title 的值还是会被修改成了@“mutableTitle”，无论title 是用copy 还是strong 修饰值都会被修改；
     但是如果再次修改 mutableTitle 的值；使用strong 修饰的字符串会被修改成和mutableTitle 一样的值
     但是如果使用copy 修饰的字符串，这个值是不会被再次修改的，还是被self.title = mutableTitle; 赋值的时候mutableTitle 的值；
     原因："copy表示该属性不保留新值，而是将其拷贝。这样一来，属性的封装性就可以得到保护，其对应的值是不会无意间被修改的
     */
    self.strongString = @"strong 修饰字符串";
    NSLog(@"self.strongString原始值 ==== %@", self.strongString);
    
    
    self.stringCopy = @"copy string";
    NSLog(@"copyString 原始值 ==== %@", self.stringCopy);
    
    
    NSMutableString *mutableStr = @"NSMutableString String".mutableCopy;
    
    // 使用strong修饰字符串，有会无意间被修改的可能性
    self.strongString = mutableStr;
    NSLog(@"self.strongString 修改后的值==== %@,  mutableStr === %@", self.strongString, mutableStr);
    
    
    // 使用copy修复的字符串
    self.stringCopy = mutableStr;
    NSLog(@"self.copyString 修改后的值==== %@,  mutableStr === %@", self.stringCopy, mutableStr);
    
    
    // 再次修改 mutableStr 后对原始值的影响
    [mutableStr appendString:@"被修改了"];
    NSLog(@"////////////////////////////////////////////");
    NSLog(@"strongString原始值 ==== %@", self.strongString);
    NSLog(@"copyString 原始值 ==== %@", self.stringCopy);
    NSLog(@"mutableStr 值 ==== %@", mutableStr);

    
    /**
     语法：== 判断的是两个指针是否是同一个对象； isequal 判断的是这两个值是否相等。
     iOS中两个指针指向不同的对象，尽管它们的值相同。但是 iOS 的编译器优化了内存分配，当两个指针指向两个值一样的 NSString 时，两者指向同一个内存地址
     */
    NSString *firstStr = @"helloworld";
    NSString *secondStr = @"helloworld";
    
    if (firstStr == secondStr) {
      NSLog(@"Equal");
    } else {
      NSLog(@"Not Equal");
    }
    
    
    /**
     多线程问题
     */
    
    UILabel *alertLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,100,100,100)];
    alertLabel.text = @"Wait 4 seconds...";
    [self.view addSubview:alertLabel];
    NSLog(@"当前线程=-----%@", [NSThread currentThread]);
    
    // 创建自定义的队列
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    // 创建主队列
    NSOperationQueue *mainQuequ = [NSOperationQueue mainQueue];
    
    /**
     使用addOperation:添加任务到队列后能开启新线程，并发执行任务
     当 maxConcurrentOperationCount 为1时，说明添加的任务时串行执行的
     串行执行 != 同一个线程执行
     */
    [backgroundQueue addOperationWithBlock:^{
        [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:4]];
        NSLog(@"延时执行=-----%@", [NSThread currentThread]);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"主队列中更新UI-----%@", [NSThread currentThread]);
            alertLabel.text = @"Ready to go!";
        }];
    }];
}

@end
