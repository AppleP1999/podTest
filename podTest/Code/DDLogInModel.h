//
//  DDLogInMOdel.h
//  podTest
//
//  Created by DengOC on 2018/6/29.
//  Copyright © 2018年 DDAppleDengjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface DDLogInModel : NSObject
@property(nonatomic,copy) NSString *uerlName  ;
@property(nonatomic,copy) NSString *uerlPassword;
@property(nonatomic,strong)RACCommand *  loginCommand;
- (instancetype)initWithLoginRequstSignal:(RACSignal*)requstSignal;

@end
