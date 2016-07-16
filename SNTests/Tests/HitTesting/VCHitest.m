//
//  VCHitest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/7/9.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCHitest.h"
#import "Header.h"
#import "KVTouchView.h"
@interface VCHitest ()

@end

@implementation VCHitest

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    KVTouchView* content=VIEW_RECT(KVTouchView, CGRectMake(0, 0, 100, 100));
    [content setBackgroundColor:[UIColor redColor]];
    
    UIButton* button=VIEW_RECT(UIButton, CGRectMake(0, 0, 200, 200));
    [button setBackgroundColor:[UIColor greenColor]];
    [button setAlpha:0.3];
    [button addTarget:self action:@selector(handleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:content];
    [content addSubview:button];
    [content setCenter:self.view.center];
    [button setCenter:CGPointMake(CGRectGetWidth(content.frame)/2, CGRectGetHeight(content.frame)/2)];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)handleButtonClick:(id)sender
{
    LOG_SELECTOR;
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
