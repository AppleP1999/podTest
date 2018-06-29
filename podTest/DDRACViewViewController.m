//
//  DDRACViewViewController.m
//  podTest
//
//  Created by DengOC on 2018/6/25.
//  Copyright © 2018年 DDAppleDengjie. All rights reserved.
//

#import "DDRACViewViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface DDRACViewViewController ()

@end

@implementation DDRACViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(void)initUI
{
    UIButton * button = [[UIButton  alloc] init];
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
       
        NSLog(@"134");
    }];
    [self.view addSubview:button];
}
-(void)arrayData
{
    NSArray * dataAtrray = @[@"RACSubject信号" , @"RACSignal 信号静态"];
    
}

/**
 RACSubject与RACSignal在发送信号这件事上是基本相同的(创建信号时没有block。必须订阅者在前否者不能成功订阅 )
 // RACSubject:底层实现和RACSignal不一样。
 // 1.调用subscribeNext订阅信号，只是把订阅者保存起来，并且订阅者的nextBlock已经赋值了。
 // 2.调用sendNext发送信号，遍历刚刚保存的所有订阅者，一个一个调用订阅者的nextBlock。
 RACReplaySubject则不用考虑订阅信号的先后顺序,所以比较推荐使用这个.另外RACSubject也可以用作代理代理,当然这也是有限制的,只能替代那些没有返回值的代理.
 
 */
-(void)funcNameRACSubjectDemo
{
    
    RACSubject *   subSig =  [RACSubject  subject];
        
    [subSig sendNext:@"RACSubject  发送"];
    [subSig sendCompleted];
    

    //这里有个原则,那就是还是要先订阅在发送信号
    [subSig subscribeNext:^(id x) {
       
        NSLog(@"Subject 成功订阅%@" ,x );
    } error:^(NSError *error) {
        NSLog(@"error： %s",__func__);
    } completed:^{
        NSLog(@"completed： %s",__func__);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
