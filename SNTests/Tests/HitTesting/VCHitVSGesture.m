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

@implementation VCHitVSGesture
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture)]];
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture)]];
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
@end
