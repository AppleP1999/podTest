//
//  NetworkTool.m
//  来店易
//
//  Created by yejianping on 16/6/21.
//  Copyright © 2016年 u1city01. All rights reserved.
//

#import "NetworkTool.h"

@implementation NetworkTool

/**
 创建网络请求管理类单例对象
 
 @param baseUrl 域名url
 @return <#return value description#>
 */
+ (AFHTTPSessionManager *)sharedAFHTTPSessionManager {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager =nil;
        //[[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:[ApiTokenHelper getApiUrl]]];
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO//如果是需要验证自建证书，需要设置为YES
        securityPolicy.allowInvalidCertificates = NO;
        //validatesDomainName 是否需要验证域名，默认为YES；
        securityPolicy.validatesDomainName = NO;
        manager.securityPolicy = securityPolicy;
    });
    return manager;
}

/*!
 * 监听网络状态
 */
+ (void)isEnableNetWithBlock:(void (^)(BOOL isExistenceNetwork))block {
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        BOOL isExistenceNetwork = NO;
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                isExistenceNetwork = YES;
                NSLog(@"3G|4G");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                isExistenceNetwork = YES;
                NSLog(@"WIFI");
            }
                break;
                
            default:
                break;
        }
        if (block) {
            block (isExistenceNetwork);
        }
    }];
    
    [manager startMonitoring];
}

/**
 系统接口调用 GET

 @param method 接口名称
 @param parameters 参数
 @param block <#block description#>
 */
+ (void)httpGetWithMethod:(NSString *)method
           withParameters:(NSMutableDictionary *)parameters
                withBlock:(void (^)(ApiResultModel *result))block {
    
    NSMutableDictionary *tempParameters = @{}.mutableCopy;
    //[ApiTokenHelper parametersWithMethod:method withParameters:parameters];
    
    [[NetworkTool sharedAFHTTPSessionManager] GET:@"" parameters:tempParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block([[ApiResultModel alloc] initWithDict:responseObject]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block([[ApiResultModel alloc] initWithInterfaceError]);
        }
    }];
}

/**
 系统接口调用 GET
 
 @param method 接口名称
 @param parameters 参数
 @param intervals 时间间隔
 @param block <#block description#>
 */
+ (void)httpGetWithMethod:(NSString *)method
           withParameters:(NSMutableDictionary *)parameters
                intervals:(int)intervals
                withBlock:(void (^)(ApiResultModel *result))block {
    
    NSMutableDictionary *tempParameters = [NSMutableDictionary dictionary];
    //[ApiTokenHelper parametersWithMethod:method withParameters:parameters];
    
//    if ([ApiTokenHelper isRequestVerifyWithMethod:method withPostTime:tempParameters[@"postTime"] intervals:intervals]) {
//
//        [[NetworkTool sharedAFHTTPSessionManager] GET:@"" parameters:tempParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            if (block) {
//                block([[ApiResultModel alloc] initWithDict:responseObject]);
//            }
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            if (block) {
//                block([[ApiResultModel alloc] initWithInterfaceError]);
//            }
//        }];
//    } else {
//        if (block) {
//            block([[ApiResultModel alloc] initWithNotAllowRequest]);
//        }
//    }
}

/**
 系统接口调用 POST

 @param method 接口名称
 @param parameters 参数
 @param block <#block description#>
 */
//+ (void)httpPostWithMethod:(NSString *)method
//            withParameters:(NSMutableDictionary *)parameters
//                 withBlock:(void (^)(ApiResultModel *result))block {
//
//    NSMutableDictionary *tempParameters = [ApiTokenHelper parametersWithMethod:method withParameters:parameters];
//
//    [[NetworkTool sharedAFHTTPSessionManager] POST:@"" parameters:tempParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (block) {
//         //   block([[ApiResultModel alloc] initWithDict:responseObject]);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (block) {
//       //     block([[ApiResultModel alloc] initWithInterfaceError]);
//        }
//    }];
//}



+ (AFHTTPSessionManager *)sharedAFHTTPSessionManagerInit {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@""]];
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO//如果是需要验证自建证书，需要设置为YES
        securityPolicy.allowInvalidCertificates = NO;
        //validatesDomainName 是否需要验证域名，默认为YES；
        securityPolicy.validatesDomainName = NO;
        manager.securityPolicy = securityPolicy;
    });
    return manager;
}

+ (void)httpGet:(NSString *)url withBlock:(void (^)(NSDictionary *result))block {
    [[NetworkTool sharedAFHTTPSessionManagerInit]GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block(nil);
        }
    }];
}

@end
