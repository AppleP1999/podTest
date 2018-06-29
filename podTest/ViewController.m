//
//  ViewController.m
//  podTest
//
//  Created by DengOC on 2018/6/19.
//  Copyright © 2018年 DDAppleDengjie. All rights reserved.
//
#import "UIButton+DDExtensiontEvent.h"
#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "DDViewController.h"
#import "DDViewModel.h"
#import "DDView.h"
#import "DDLogInModel.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *dd_button;
@property (nonatomic,strong) DDViewModel * viewModel ;
@property (nonatomic,strong	) DDView *dd_view;
@property (nonatomic, assign) NSInteger  testOc;
@property (nonatomic,strong) DDLogInModel*  logInModel;
@end

@implementation ViewController

-(DDViewModel*)viewModel
{
    if (!_viewModel) {
        _viewModel = [[DDViewModel alloc]init];;
    }
    return _viewModel;
}
static  int  dd_d =  0;
- (void)setNameWithFormat:(NSString *)format, ... {
    if (getenv("RAC_DEBUG_SIGNAL_NAMES") == NULL) return ;
    
    NSCParameterAssert(format != nil);
    
    va_list args;
    va_start(args, format);
    
    NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    NSLog(@"str = %@", str);
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.logInModel  = [self loginView];
 
 
    [self  bitSig];
}
-(NSMutableArray *)test:(NSString *)p1,...

{
    
    NSMutableArray *array = [NSMutableArray array];
    
    //   定义一具VA_LIST型的变量，这个变量是指向参数的指针
    
    va_list list;
    
    id tag;
    
    //   用VA_START宏初始化刚定义的VA_LIST变量
    
    va_start(list, p1);
    
    //  VA_ARG返回可变的参数，VA_ARG的第二个参数是你要返回的参数的类型,如果函数有多个可变参数的，依次调用VA_ARG获取各个参数
    
    while ((tag = va_arg(list, id))) {
        
        [array addObject:tag];
        
    }
    
    //  用VA_END宏结束可变参数的获取
    
    va_end(list);
    
    return array;
    
}
- (RACSignal *)loginWithUserName:(NSString *) name password:(NSString *)password
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:[NSString stringWithFormat:@"User %@, password %@, login!",name, password]];
            [subscriber sendCompleted];
        });
        return nil;
    }];
}


-(DDLogInModel*)loginView
{
    CGFloat  s_ScreenH =  [UIScreen mainScreen].bounds.size.height;
    CGFloat  s_ScreenW =  [UIScreen mainScreen].bounds.size.width;
    CGFloat  pubicWide  = s_ScreenW*0.7;
    CGFloat  pubicHigh  = 60;
    
    CGFloat  pubicY  =  s_ScreenH *0.2;
    CGFloat  pubicX  =  s_ScreenW *0.15;
    UITextField *  name_textField = [[UITextField alloc] initWithFrame:CGRectMake(pubicX, pubicY, pubicWide, pubicHigh)];
    name_textField.backgroundColor = [UIColor redColor] ;
    UITextField *  password_textField = [[UITextField alloc] initWithFrame:CGRectMake(pubicX, pubicY+pubicHigh+30, pubicWide, pubicHigh)];
    password_textField.backgroundColor = [UIColor redColor];
    @weakify(self);
    DDLogInModel*  m =  [[DDLogInModel alloc]initWithLoginRequstSignal:[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [subscriber sendNext:[NSString stringWithFormat:@"User: %@, password: %@",self.logInModel.uerlName ,self.logInModel.uerlPassword]];
        [subscriber sendCompleted];
        });
        return nil;
    }]];
    RAC(m,uerlName) = name_textField.rac_textSignal;
    RAC(m,uerlPassword) = password_textField.rac_textSignal;
     UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem ];
    btn.frame = CGRectMake(s_ScreenW *0.5-pubicWide*0.325, pubicY +pubicHigh*2+50 ,pubicWide*0.65, pubicHigh);
    [btn setTitle:@"登 2 入" forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor redColor];
//    self.dd_button.rac_command = m.loginCommand ;
    btn.rac_command = m.loginCommand;
    [[m.loginCommand executionSignals]
    
     subscribeNext:^(RACSignal * x) {
         
         btn.enabled = NO;
         NSLog(@"开始破解 :%@",x);
         [x subscribeNext:^(id x2) {
             NSLog(@"123456789");
         btn.enabled = YES;
         }];
     }];
    
    [self.view addSubview:btn];
    [self.view addSubview:name_textField];
    [self.view addSubview:password_textField ];
    return m;
}
-(void)bitSig
{
     [self.viewModel.ttSig subscribeNext:^(id x) {
        NSLog(@"绑定成功值1：  %@"  , x);
      
    }];
//    [_dd_view.viewModel.ttSig subscribeNext:^(id x) {
//        NSLog(@"绑定成功值ttSig2：  %@"  , x);
//    }];
    [_dd_view.ttSig subscribeNext:^(id x) {
        NSLog(@"绑定成功值View ttSig3：  %@"  , x);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
