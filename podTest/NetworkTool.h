//
//  NetworkTool.h
//  来店易
//
//  Created by yejianping on 16/6/21.
//  Copyright © 2016年 u1city01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

#import "ApiResultModel.h"
//#import "ApiTokenHelper.h"

@interface NetworkTool : NSObject

/*!
 * 监听网络状态
 */
+ (void)isEnableNetWithBlock:(void (^)(BOOL isExistenceNetwork))block;

/**
 系统接口调用 GET
 
 @param method 接口名称
 @param parameters 参数
 @param block <#block description#>
 */
+ (void)httpGetWithMethod:(NSString *)method
           withParameters:(NSMutableDictionary *)parameters
                withBlock:(void (^)(ApiResultModel *result))block;

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
                withBlock:(void (^)(ApiResultModel *result))block;

/**
 系统接口调用 POST
 
 @param method 接口名称
 @param parameters 参数
 @param block <#block description#>
 */
+ (void)httpPostWithMethod:(NSString *)method
            withParameters:(NSMutableDictionary *)parameters
                 withBlock:(void (^)(ApiResultModel *result))block;

+ (void)httpGet:(NSString *)url withBlock:(void (^)(NSDictionary *result))block;

@end
