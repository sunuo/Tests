
//
//  VCTouchTransfer.m
//  SNTests
//
//  Created by xukaitiankevin on 16/10/11.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCTouchTransfer.h"
#import "Header.h"
#import "KVTouchView.h"
@interface VCTouchTransfer ()

@end

@implementation VCTouchTransfer

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width  =  CGRectGetWidth(self.view.frame);
    CGFloat height  =  CGRectGetHeight(self.view.frame);
    
    KVTouchView* touch1 = VIEW_RECT(KVTouchView,CGRectMake(0, 0, width, height/2));
    KVTouchView* touch2 = VIEW_RECT(KVTouchView,CGRectMake(0, CGRectGetMaxY(touch1.frame), width, height/2));
    
    UIView* view1 = VIEW_RECT(UIView, CGRectMake(width/2, CGRectGetMinY(touch1.frame), width/2, height/2));
    UIControl* view2 = VIEW_RECT(UIControl, CGRectMake(width/2, 0, width/2, height/2));
    
    touch1.name = @"sibling";
    touch2.name = @"father";
    [touch1 setBackgroundColor:[UIColor redColor]];
    [touch2 setBackgroundColor:[UIColor orangeColor]];
    [view1 setBackgroundColor:[UIColor blueColor]];
    [view2 setBackgroundColor:[UIColor greenColor]];
    
    [self.view addSubview:touch1];
    [self.view addSubview:touch2];
    [self.view addSubview:view1];
    [touch2 addSubview:view2];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
