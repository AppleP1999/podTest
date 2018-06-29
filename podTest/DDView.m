//
//  DDView.m
//  podTest
//
//  Created by DengOC on 2018/6/22.
//  Copyright © 2018年 DDAppleDengjie. All rights reserved.
//

#import "DDView.h"
#import "UIButton+DDExtensiontEvent.h"
@implementation DDView
//-(DDViewModel*)viewModel
//{
//    if (!_viewModel) {
//        _viewModel = [[DDViewModel alloc ] init];;
//    }
//    return _viewModel;
//}

-(RACSubject *)ttSig
{
    if (!_ttSig) {
        _ttSig = [RACSubject subject];
    }
    return _ttSig;
}
//- (instancetype)initWithViewModel:(id<UCViewModelProtocol>)viewModel {
//
//    self.viewModel = (DDViewModel *)viewModel;
//    return [super initWithViewModel:viewModel];
//}

- (instancetype)initWithFrame:(CGRect)frame ViewModel:(id<UCViewModelProtocol>)viewModel
{
    self = [super initWithFrame:frame];
    if (self) {
        self.viewModel = (DDViewModel *)viewModel;

        UIButton * btn = [UIButton  buttonFrame:CGRectMake(50, 50, 80, 60)    callBlcok:^(UIButton *sender) {
//            DDViewModel *  m = [[DDViewModel alloc] init];
//            m.ttSig =  self.ttSig;
//            self.viewModel  = m;
            [self.viewModel.ttSig  sendNext:@"model - 绑定数据"];

             [self.ttSig sendNext:@"view 绑定成个"];
        }];
        btn.backgroundColor = [UIColor redColor];
        [self addSubview:btn];
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
