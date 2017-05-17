//
//  VCResponderChainTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/3.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCResponderChainTest.h"
#import "KVTouchView.h"
#import "Header.h"

@implementation VCResponderChainTest
-(void)viewDidLoad
{
    [super viewDidLoad];
//实验一 -----------------------------
    UIView* sub = [[UIView alloc] initWithFrame:self.view.bounds];
//    结果：由于本身没有处理，所以forward到父view 处理
//    2016-08-03 17:32:42.230 SNTests[26188:333171] LOG:::KVTouchView___touchesBegan:withEvent:___<KVTouchView: 0x7ff9e3d67b10; frame = (0 0; 320 568); layer = <CALayer: 0x7ff9e3d68af0>>
//    2016-08-03 17:32:42.326 SNTests[26188:333171] LOG:::KVTouchView___touchesEnded:withEvent:___<KVTouchView: 0x7ff9e3d67b10; frame = (0 0; 320 568); layer = <CALayer: 0x7ff9e3d68af0>>
    
//实验二 -----------------------------
//    KVTouchView* sub = [[KVTouchView alloc] initWithFrame:self.view.bounds];
//    sub.name = @"sub";
//    结果：由于本身有处理，父view没有机会处理
//    2016-08-03 17:29:45.574 SNTests[26056:330259] ---sub
//    2016-08-03 17:29:45.576 SNTests[26056:330259] LOG:::KVTouchView___touchesBegan:withEvent:___<KVTouchView: 0x7fd719647840; frame = (0 0; 320 568); layer = <CALayer: 0x7fd719644900>>
//    2016-08-03 17:29:45.708 SNTests[26056:330259] ---sub
//    2016-08-03 17:29:45.708 SNTests[26056:330259] LOG:::KVTouchView___touchesEnded:withEvent:___<KVTouchView: 0x7fd719647840; frame = (0 0; 320 568); layer = <CALayer: 0x7fd719644900>>
//    2016-08-03 17:29:49.463 SNTests[26056:330259] ---sub
//    2016-08-03 17:29:49.463 SNTests[26056:330259] LOG:::KVTouchView___touchesBegan:withEvent:___<KVTouchView: 0x7fd719647840; frame = (0 0; 320 568); layer = <CALayer: 0x7fd719644900>>
//    2016-08-03 17:29:49.549 SNTests[26056:330259] ---sub
//    2016-08-03 17:29:49.549 SNTests[26056:330259] LOG:::KVTouchView___touchesEnded:withEvent:___<KVTouchView: 0x7fd719647840; frame = (0 0; 320 568); layer = <CALayer: 0x7fd719644900>>
    
//实验三 -----------------------------
//    UIControl* sub = [[UIControl alloc] initWithFrame:self.view.bounds];
//    结果：点击无响应 说明UIControl没有forward到父view
    
//实验四 -----------------------------
//    UILabel* sub = [[UILabel alloc] initWithFrame:self.view.bounds];
//    sub.userInteractionEnabled=YES;
//    [sub setTextAlignment:NSTextAlignmentCenter];[sub setText:@"CLICK ME"];[sub setFont:[UIFont systemFontOfSize:20.0f]];
//    结果：同实验一
//    2016-08-03 17:38:16.154 SNTests[26480:339727] LOG:::KVTouchView___touchesBegan:withEvent:___<KVTouchView: 0x7fdbb0f926c0; frame = (0 0; 320 568); layer = <CALayer: 0x7fdbb0f2ef70>>
//    2016-08-03 17:38:16.231 SNTests[26480:339727] LOG:::KVTouchView___touchesEnded:withEvent:___<KVTouchView: 0x7fdbb0f926c0; frame = (0 0; 320 568); layer = <CALayer: 0x7fdbb0f2ef70>>

//实验五 -----------------------------
//    UIImageView* sub = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    sub.userInteractionEnabled=YES;[sub setImage:[UIImage imageNamed:@"memda.jpg"]];
//    结果:同实验一
//    2016-08-03 17:43:01.813 SNTests[26724:346694] LOG:::KVTouchView___touchesBegan:withEvent:___<KVTouchView: 0x7f9a127ba730; frame = (0 0; 320 568); layer = <CALayer: 0x7f9a12776c20>>
//    2016-08-03 17:43:01.908 SNTests[26724:346694] LOG:::KVTouchView___touchesEnded:withEvent:___<KVTouchView: 0x7f9a127ba730; frame = (0 0; 320 568); layer = <CALayer: 0x7f9a12776c20>>
    
    
    [self.view addSubview:sub];
    
}

-(void)loadView
{
    self.view=[[KVTouchView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view setBackgroundColor:[UIColor whiteColor]];//子view不响应则父view 响应
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{//在实验一中，注销掉上面的 -(void)loadView 方法，则会走到这里
//    LOG_SELECTOR;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{//在实验一中，注销掉上面的 -(void)loadView 方法，则会走到这里
//    LOG_SELECTOR;
}
@end
