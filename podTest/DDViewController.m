//
//  DDViewController.m
//  podTest
//
//  Created by DengOC on 2018/6/21.
//  Copyright © 2018年 DDAppleDengjie. All rights reserved.
//
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "DDViewController.h"
#import "UIButton+DDExtensiontEvent.h"
@interface DDViewController ()

@end

@implementation DDViewController
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    
        
        DDViewController *viewController = [super allocWithZone:zone];
   @weakify(viewController)
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(viewController)
        [viewController funcName];
         
    } ];
    return viewController;
}
-(void)funcName
{
    NSLog(@"%s",__func__);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    @weakify(self);
    UIButton * btn = [UIButton buttonFrame:CGRectMake(100, 50, 80, 50) callBlcok:^(UIButton *sender) {
        
        [self  dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
    
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc
{
    NSLog(@"12345678");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
