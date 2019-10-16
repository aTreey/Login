//
//  SOAPController.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/27.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "SOAPController.h"
#import <AFNetworking.h>
#import "Soap.h"
#import "LoginOC-Swift.h"


typedef NS_ENUM(NSUInteger, TestDisplacementEnum) {
    TestDisplacementEnumNone = 1 << 0,
    TestDisplacementEnumA = 1 << 1,
    TestDisplacementEnumB = 1 << 2,
    TestDisplacementEnumC = 1 << 3,
};

@interface SOAPController ()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
// 位移枚举
@property (nonatomic, assign) TestDisplacementEnum displacementEnum;

@end

@implementation SOAPController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
//    [self setupManager];
    self.displacementEnum = TestDisplacementEnumA;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.displacementEnum = self.displacementEnum | TestDisplacementEnumB;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    self.displacementEnum = self.displacementEnum | TestDisplacementEnumC;
    
//    [self soapTest];
    
    NSDictionary *obj = self.dict;
    
    if ([obj.allKeys containsObject:@"key"]) {
//        NSInteger num = [obj[@"key"] integerValue];
//        NSLog(@"num==%ld", num);
    }
    
    NSLog(@"objc = %@----type==%@", obj, obj[@"key"]);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self afnetworkingSoap];
    
    [self testDisplacementEnum:self.displacementEnum];
    
}

- (void)testDisplacementEnum:(TestDisplacementEnum)displacementEnum {
    if (displacementEnum == TestDisplacementEnumA) {
        NSLog(@" == TestDisplacementEnumA");

    } else if (displacementEnum == TestDisplacementEnumB) {
        NSLog(@" == TestDisplacementEnumB");
    } else if (displacementEnum == TestDisplacementEnumC) {
        NSLog(@" == TestDisplacementEnumC");
    }
    
//    else if (((displacementEnum & TestDisplacementEnumA) == TestDisplacementEnumA)
//               && ((displacementEnum & TestDisplacementEnumB) == TestDisplacementEnumB)
//               ) {
//        NSLog(@" == TestDisplacement");
//    }
    
    else if ((displacementEnum & TestDisplacementEnumA) == TestDisplacementEnumA) {
        NSLog(@" == TestDisplacementEnumA");
    }
}

- (void)testSoap {
    OC_Swift_EnumController *testController = [OC_Swift_EnumController new];
    testController.type = TestStateTwo;
    [self.navigationController pushViewController:testController animated:true];
}


- (void)soapTest {
    NSString *fileName = @"MobileCodeWS";
    NSString *methodName = @"getMobileCodeInfo";
    NSDictionary *parameters = @{@"mobileCode": @"18513852394"};
    
    // 获取SOAP信封
    SoapUtility *soapUtility = [[SoapUtility alloc] initFromFile:fileName];
    NSString *string = [soapUtility BuildSoap12withMethodName:methodName withParas: parameters];
    
    // 获取Action
    NSString *soapAction = [soapUtility GetSoapActionByMethodName:methodName SoapType:SOAP12];
    
    // 发送请求
    SoapService *request = [[SoapService alloc] init];
    request.PostUrl = @"http://ws.webxml.com.cn/WebServices/MobileCodeWS.asmx";
    request.SoapAction = soapAction;
    
    // 同步
//    ResponseData *result = [request PostSync:string];
//    NSLog(@"result --- code == %ld, content == %@", result.StatusCode, result.Content);
    
    // 异步
    [request PostAsync:string Success:^(NSString *response) {
        NSLog(@"response = %@\n", response);
    } falure:^(NSError *error) {
        NSLog(@"error = %@", error);
    }];
}


- (void)setupManager {
    
    NSString *tel = @"18513852394";
    
    // 消息
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                             "<soap12:Envelope "
                             "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
                             "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" "
                             "xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">"
                             "<soap12:Body>"
                             "<getMobileCodeInfo xmlns=\"http://WebXml.com.cn/\">"
                             "<mobileCode>%@</mobileCode>"
                             "<userID>%@</userID>"
                             "</getMobileCodeInfo>"
                             "</soap12:Body>"
                             "</soap12:Envelope>", tel, @""];
    
    _manager = [AFHTTPSessionManager manager];
    
    [_manager.requestSerializer setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    _manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    [_manager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable __autoreleasing * _Nullable error) {
        return soapMessage;
    }];
}

- (void)afnetworkingSoap {
    
    NSString *tel = @"18513852394";
    
    // 消息
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                             "<soap12:Envelope "
                             "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
                             "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" "
                             "xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">"
                             "<soap12:Body>"
                             "<getMobileCodeInfo xmlns=\"http://WebXml.com.cn/\">"
                             "<mobileCode>%@</mobileCode>"
                             "<userID>%@</userID>"
                             "</getMobileCodeInfo>"
                             "</soap12:Body>"
                             "</soap12:Envelope>", tel, @""];
    
    // url
    
    NSString *urlString = @"http://webservice.webxml.com.cn/WebServices/MobileCodeWS.asmx";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable __autoreleasing * _Nullable error) {
        return soapMessage;
    }];
    
    
    [manager POST:urlString parameters:soapMessage progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    }];
    
}



- (void)afnTest {
    
    _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    NSString *url = @"https://api.douban.com/v2/movie/in_theaters";
    [_manager POST:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    }];
}
@end
