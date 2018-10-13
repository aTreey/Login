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


@interface SOAPController ()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation SOAPController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self setupManager];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self afnetworkingSoap];
    
    [self soapTest];
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