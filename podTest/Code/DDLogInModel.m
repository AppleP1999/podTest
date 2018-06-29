//
//  DDLogInMOdel.m
//  podTest
//
//  Created by DengOC on 2018/6/29.
//  Copyright © 2018年 DDAppleDengjie. All rights reserved.
//

#import "DDLogInModel.h"
 @implementation DDLogInModel
- (instancetype)initWithLoginRequstSignal:(RACSignal*)requstSignal;
{
    self = [super init];
    if (self) {
        RACSignal  *  userNameSignal =  [RACObserve(self, uerlName) map:^id(id value) {
            NSString* nameString = value;            return @(nameString.length >= 6 ) ;
        }];
        
        RACSignal  *  userPasswodeNSignal =  [RACObserve(self, uerlPassword) map:^id(id value) {
            NSString* uerlPassword = value;
            return @(uerlPassword.length >= 6);
        }];
  
        RACSignal * loginBtnEnable  = [RACSignal combineLatest:@[userNameSignal , userPasswodeNSignal] reduce:^id(NSNumber *  name,NSNumber * password ){
            return @(name.boolValue && password.boolValue);
        }];
        
        _loginCommand =[[RACCommand alloc] initWithEnabled:loginBtnEnable signalBlock:^RACSignal *(id input) {
            
            return requstSignal;
        }];
        
    }
    return self;
}
@end
