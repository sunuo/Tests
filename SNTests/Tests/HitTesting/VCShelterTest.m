//
//  VCShelterTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/4.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCShelterTest.h"
#import "KVSpayButton.h"
#import "Header.h"
@implementation VCShelterTest
-(void)viewDidLoad
{
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    KVSpayButton* button = [[KVSpayButton alloc] initWithFrame:self.view.bounds];
//    [button setTitle:@"click me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleButtonTouchDown) forControlEvents:UIControlEventTouchDown];
    
    
    UIView* vw =VIEW_RECT(UIView, CGRectMake(0, 0, 100, 100));
    [vw setBackgroundColor:[UIColor redColor]];
    
    [button addSubview:vw];
    [self.view addSubview:button];
    
}


-(void)handleButtonTouchDown
{
    LOG_SELECTOR;
}

@end
