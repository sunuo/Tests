
//
//  VCTouchTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/7/9.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCTouchTest.h"
#import "Header.h"
#import "KVTouchView.h"
@interface VCTouchTest ()

@end

@implementation VCTouchTest

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    KVTouchView* content=VIEW_RECT(KVTouchView, CGRectMake(0, 0, 200, 200));
    [content setBackgroundColor:[UIColor redColor]];
    [content setAlpha:0.3];
    
    KVTouchView* button=VIEW_RECT(KVTouchView, CGRectMake(0, 0, 100, 100));
    [button setBackgroundColor:[UIColor greenColor]];
    [button setAlpha:0.3];
    
    
    [self.view addSubview:content];
    [content addSubview:button];
    [content sendSubviewToBack:button];
    [content setCenter:self.view.center];
    [button setCenter:CGPointMake(CGRectGetWidth(content.frame)/2, CGRectGetHeight(content.frame)/2)];
    

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
