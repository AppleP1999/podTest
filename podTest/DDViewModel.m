//
//  DDViewModel.m
//  podTest
//
//  Created by DengOC on 2018/6/22.
//  Copyright © 2018年 DDAppleDengjie. All rights reserved.
//

#import "DDViewModel.h"

@implementation DDViewModel

-(RACSubject *)ttSig
{
    if (!_ttSig) {
        _ttSig = [RACSubject subject];
    }
    return _ttSig;
}
@end
