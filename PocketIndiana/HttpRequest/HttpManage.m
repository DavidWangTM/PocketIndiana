//
//  HttpManage.m
//
//  Created by DavidWang on 15/7/23.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "HttpManage.h"

@implementation AFConnectionJSONClient


static NSString * const APIBaseURLString = @"";

+ (instancetype)sharedClient {
    static AFConnectionJSONClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFConnectionJSONClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
//        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
        [_sharedClient.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

- (instancetype)init{
    AFConnectionJSONClient *client = [[AFConnectionJSONClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
    client.requestSerializer = [AFJSONRequestSerializer serializer];
    client.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    return client;
}

@end

@implementation AFConnectionAPIClient

+ (instancetype)sharedClient {
    static AFConnectionAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFConnectionAPIClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
        _sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}



- (instancetype)init{
    AFConnectionAPIClient *client = [[AFConnectionAPIClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
    client.responseSerializer = [AFHTTPResponseSerializer serializer];
    client.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    return client;
}

@end

@implementation HttpManage
/**
 * POST 请求方式
 * @param url 请求地址
 * @param params 请求参数
 * @param className 返回模型
 * @param callback 数据回调代码块
 */
+(void)postRequest:(NSString *)url withParams:(NSDictionary *)params withReturnClassName:(NSString *)className withCallback:(void(^)(BOOL isOK ,id model))callback {

    [[AFConnectionJSONClient sharedClient] POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData *resData = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];

        if (className) {
            id model = [MTLJSONAdapter modelOfClass:NSClassFromString(className) fromJSONDictionary:resultDic error:nil];
            callback(YES,model);
            
        } else {
            callback(YES,resultDic);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSString *html = operation.responseString;
        callback(NO,nil);
    }];
}

/**
 * GET 请求方式
 * @param url 请求地址
 * @param params 请求参数
 * @param className 返回模型
 * @param callback 数据回调代码块
 */
+(void)getReqeust:(NSString *)url withParams:(NSDictionary *)params withReturnClassName:(NSString *)className withCallback:(void(^)(BOOL isOK ,id model))callback {
    
    [[AFConnectionJSONClient sharedClient] GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData *resData = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        
        if (className) {
            id model = [MTLJSONAdapter modelOfClass:NSClassFromString(className) fromJSONDictionary:resultDic error:nil];
            callback(YES,model);
        } else {
            callback(YES,resultDic);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callback(NO,nil);
    }];
}

/**
 * Del 请求方式
 * @param url 请求地址
 * @param params 请求参数
 * @param className 返回模型
 * @param callback 数据回调代码块
 */
+(void)DelReqeust:(NSString *)url withParams:(NSDictionary *)params withReturnClassName:(NSString *)className withCallback:(void(^)(BOOL isOK ,id model))callback {
    
    [[AFConnectionJSONClient sharedClient] DELETE:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData *resData = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        
        if (className) {
            id model = [MTLJSONAdapter modelOfClass:NSClassFromString(className) fromJSONDictionary:resultDic error:nil];
            callback(YES,model);
        } else {
            callback(YES,resultDic);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callback(NO,nil);
    }];
}



@end
