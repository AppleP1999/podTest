//
//  ApiResultModel.m
//  TaoShop
//
//  Created by u1city01 on 14-7-30.
//  Copyright (c) 2014年 u1city01. All rights reserved.
//

#import "ApiResultModel.h"

@implementation ApiResultModel

//构造方法
- (id)initWithDict:(NSDictionary *)dict {
    if (self=[super init]) {
        NSError *error = nil;
        
        self.code=@"500";
        if (dict!=nil && dict[@"Code"]!=[NSNull null]) {
            self.code=dict[@"Code"];
        }
        
        self.message=@"";
        if (dict!=nil && dict[@"Message"]!=[NSNull null]) {
            self.message=dict[@"Message"];
        }

        self.returndata=nil;
        if (dict!=nil && dict[@"Result"]!=[NSNull null]) {
            if ([dict[@"Result"] isKindOfClass:[NSString class]]) {
                self.returndata = [NSJSONSerialization JSONObjectWithData:[(NSString*)dict[@"Result"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
            } else if ([dict[@"Result"] isKindOfClass:[NSDictionary class]]) {
                self.returndata = dict[@"Result"];
            }
        }
    }
    return self;
}

//接口返回错误数据模型
- (id)initWithInterfaceError {
    if (self=[super init]) {
        self.code=@"500";
        self.message=@"亲，您的手机网络不太顺畅哦～";
        self.returndata=nil;
    }
    return self;
}

//无网络数据模型
- (id)initWithEnableNet {
    if (self=[super init]) {
        self.code=@"404";
        self.message=@"亲，您的手机没有网络连接哦～";
        self.returndata=nil;
    }
    return self;
}

//没过时间间隔不允许访问接口
- (id)initWithNotAllowRequest {
    if (self=[super init]) {
        self.code=@"405";
        self.message=@"";
        self.returndata=nil;
    }
    return self;
}

@end
