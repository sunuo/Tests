//
//  VCHitVSGesture.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/3.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCHitVSGesture.h"
#import "KVTouchView.h"
#import "Header.h"

@interface VCHitVSGesture()<UIGestureRecognizerDelegate>

@end

@implementation VCHitVSGesture
-(void)viewDidLoad
{
    [super viewDidLoad];
    
//实验对象一
    UIView * sub = [[UIView alloc] initWithFrame:self.view.bounds];[sub setBackgroundColor:[UIColor greenColor]];
    UIGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture)];
    [sub addGestureRecognizer:tap];
    tap.delegate=self;
    
    UIGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture)];
    [sub addGestureRecognizer:pan];
    pan.delegate=self;
    
    [self.view addSubview:sub];
    
//实验对象二
//    UIGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture)];
//    [self.view addGestureRecognizer:tap];
//    tap.delegate=self;
//    
//    UIGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture)];
//    [self.view addGestureRecognizer:pan];
//    pan.delegate=self;
    
//Tap 实验 -----------------------------
//    2016-08-03 18:52:47.290 SNTests[34178:406677] LOG:::KVTouchView___touchesBegan:withEvent:___<KVTouchView: 0x7fdb4be1f760; frame = (0 0; 320 568); gestureRecognizers = <NSArray: 0x7fdb4be0c8d0>; layer = <CALayer: 0x7fdb4be04b70>>
//    2016-08-03 18:52:47.385 SNTests[34178:406677] LOG:::VCHitVSGesture___gestureRecognizerShouldBegin:___<VCHitVSGesture: 0x7fdb4bdc3b40>
//    2016-08-03 18:52:47.386 SNTests[34178:406677] LOG:::VCHitVSGesture___handleTapGesture___<VCHitVSGesture: 0x7fdb4bdc3b40>
    
//Pan 实验 -----------------------------
//    2016-08-03 18:57:39.097 SNTests[34178:406677] LOG:::KVTouchView___touchesBegan:withEvent:___<KVTouchView: 0x7fdb4be1f760; frame = (0 0; 320 568); gestureRecognizers = <NSArray: 0x7fdb4be0c8d0>; layer = <CALayer: 0x7fdb4be04b70>>
//    2016-08-03 18:57:39.432 SNTests[34178:406677] LOG:::KVTouchView___touchesMoved:withEvent:___<KVTouchView: 0x7fdb4be1f760; frame = (0 0; 320 568); gestureRecognizers = <NSArray: 0x7fdb4be0c8d0>; layer = <CALayer: 0x7fdb4be04b70>>
//    2016-08-03 18:57:39.448 SNTests[34178:406677] LOG:::KVTouchView___touchesMoved:withEvent:___<KVTouchView: 0x7fdb4be1f760; frame = (0 0; 320 568); gestureRecognizers = <NSArray: 0x7fdb4be0c8d0>; layer = <CALayer: 0x7fdb4be04b70>>
//    2016-08-03 18:57:39.465 SNTests[34178:406677] LOG:::KVTouchView___touchesMoved:withEvent:___<KVTouchView: 0x7fdb4be1f760; frame = (0 0; 320 568); gestureRecognizers = <NSArray: 0x7fdb4be0c8d0>; layer = <CALayer: 0x7fdb4be04b70>>
//    2016-08-03 18:57:39.482 SNTests[34178:406677] LOG:::KVTouchView___touchesMoved:withEvent:___<KVTouchView: 0x7fdb4be1f760; frame = (0 0; 320 568); gestureRecognizers = <NSArray: 0x7fdb4be0c8d0>; layer = <CALayer: 0x7fdb4be04b70>>
//    2016-08-03 18:57:39.499 SNTests[34178:406677] LOG:::VCHitVSGesture___gestureRecognizerShouldBegin:___<VCHitVSGesture: 0x7fdb4bdc3b40>
//    2016-08-03 18:57:39.500 SNTests[34178:406677] LOG:::VCHitVSGesture___handlePanGesture___<VCHitVSGesture: 0x7fdb4bdc3b40>
//    2016-08-03 18:57:39.517 SNTests[34178:406677] LOG:::VCHitVSGesture___handlePanGesture___<VCHitVSGesture: 0x7fdb4bdc3b40>
//    2016-08-03 18:57:39.517 SNTests[34178:406677] LOG:::VCHitVSGesture___handlePanGesture___<VCHitVSGesture: 0x7fdb4bdc3b40>
//    2016-08-03 18:57:39.534 SNTests[34178:406677] LOG:::VCHitVSGesture___handlePanGesture___<VCHitVSGesture: 0x7fdb4bdc3b40>
//    2016-08-03 18:57:39.552 SNTests[34178:406677] LOG:::VCHitVSGesture___handlePanGesture___<VCHitVSGesture: 0x7fdb4bdc3b40>
//    2016-08-03 18:57:39.568 SNTests[34178:406677] LOG:::VCHitVSGesture___handlePanGesture___<VCHitVSGesture: 0x7fdb4bdc3b40>
//    2016-08-03 18:57:39.640 SNTests[34178:406677] LOG:::VCHitVSGesture___handlePanGesture___<VCHitVSGesture: 0x7fdb4bdc3b40>
//    2016-08-03 18:57:39.657 SNTests[34178:406677] LOG:::VCHitVSGesture___handlePanGesture___<VCHitVSGesture: 0x7fdb4bdc3b40>
    
    
    
    
    
}

-(void)loadView
{
    self.view=[[KVTouchView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view setBackgroundColor:[UIColor whiteColor]];//子view不响应则父view 响应
}

-(void)handleTapGesture
{
    LOG_SELECTOR;
}

-(void)handlePanGesture
{
    LOG_SELECTOR;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    
    LOG_SELECTOR;
    return YES;
}



@end
