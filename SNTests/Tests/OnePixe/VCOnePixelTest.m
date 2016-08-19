
//
//  VCOnePixelTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/19.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCOnePixelTest.h"
#import "Header.h"
#import "DrawView.h"
@implementation VCOnePixelTest


-(void)viewDidLoad
{
    //
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    CGFloat height =CGRectGetHeight(self.view.frame);
    
    UIView* lineOne  = [[UIView alloc] initWithFrame:CGRectMake(20,0,1.0f/kMainScreenScale,height)];
    [lineOne setBackgroundColor:[UIColor greenColor]];
    
    UIView* lineTwo  = [[UIView alloc] initWithFrame:CGRectMake(40+0.5,0,1.0f/kMainScreenScale,height)];
    [lineTwo setBackgroundColor:[UIColor greenColor]];
    
    [self.view addSubview:lineOne];
    [self.view addSubview:lineTwo];
    
    UIView* vw1 = [[DrawView alloc] initWithFrame:CGRectMake(64, 100, 84,38.5)];
//    [vw1.layer setBorderColor:[UIColor greenColor].CGColor];
//    [vw1.layer setBorderWidth:(1.0f/kMainScreenScale)];

    [self.view addSubview:vw1];
    
    
//    UIView* draw1 = [[DrawView alloc] initWithFrame:CGRectMake(150, 100, 50, 50)];
//    [self.view addSubview:draw1];
    
    
}

@end
