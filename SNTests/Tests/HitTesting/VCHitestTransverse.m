
//
//  VCHitestTransverse.m
//  SNTests
//
//  Created by xukaitiankevin on 16/7/16.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCHitestTransverse.h"
#import "VWTansverse.h"
#import "Header.h"
@interface VCHitestTransverse ()

@end

@implementation VCHitestTransverse

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    VWTansverse* view0=VIEW(VWTansverse, 0, 0, CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame));
    view0.center=self.view.center;
    view0.name=@"view0";
    [view0 setBackgroundColor:[UIColor redColor]];
    view0.alpha=0.2;
    
    VWTansverse* view1=VIEW(VWTansverse, 0, 0, CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame));
    view1.center=self.view.center;
    view1.name=@"view1";
    [view1 setBackgroundColor:[UIColor greenColor]];
    view1.alpha=0.5;
    
    
    VWTansverse* view1_0=VIEW(VWTansverse, 0, 0, CGRectGetWidth(view1.frame)/2, CGRectGetWidth(view1.frame)/2);
    view1_0.name=@"view1_0";
    [view1_0 setBackgroundColor:[UIColor redColor]];
    view1_0.alpha=0.5;
    
    VWTansverse* view1_1=VIEW(VWTansverse, CGRectGetWidth(view1.frame)/2, 0, CGRectGetWidth(view1.frame)/2, CGRectGetWidth(view1.frame)/2);
    view1_1.name=@"view1_1";
    [view1_1 setBackgroundColor:[UIColor blackColor]];
    view1_1.alpha=0.5;
    
    
    [self.view addSubview:view0];
    [self.view addSubview:view1];
    [view1 addSubview:view1_0];
    [view1 addSubview:view1_1];
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
