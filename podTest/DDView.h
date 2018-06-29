//
//  DDView.h
//  podTest
//
//  Created by DengOC on 2018/6/22.
//  Copyright © 2018年 DDAppleDengjie. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol UCViewModelProtocol;

@protocol UCViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <UCViewModelProtocol>)viewModel;

- (void)uc_bindViewModel;
- (void)uc_setupViews;
- (void)uc_addReturnKeyBoard;

@end
//@class DDViewModel;
#import "DDViewModel.h"
@interface DDView : UIView<UCViewProtocol>
//- (instancetype)initWithViewModel:(id <UCViewModelProtocol>)viewModel;
- (instancetype)initWithFrame:(CGRect)frame ViewModel:(id<UCViewModelProtocol>)viewModel
;
@property (nonatomic,strong) DDViewModel * viewModel;
@property (nonatomic,strong) RACSubject * ttSig;

@end
