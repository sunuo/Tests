//
//  VCTagTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/6/20.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCTagTest.h"

@interface VCTagTest ()

@end

@implementation VCTagTest

- (void)viewDidLoad {
    
    [super viewDidLoad];


    UIView* v1=[[UIView alloc] initWithFrame:self.view.bounds];
    [v1 setBackgroundColor:[UIColor orangeColor]];

    UIView* v2= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [v2 setBackgroundColor:[UIColor redColor]];
    
    UIView* v3= [[UIView alloc] initWithFrame:CGRectMake(0, 100, 50, 50)];
    [v3 setBackgroundColor:[UIColor greenColor]];
    
    [v1 addSubview:v2];
    [v1 addSubview:v3];
    
    v2.tag=111;
    v3.tag=112;
    v1.tag=111;
    
    [self.view addSubview:v1];
    
    
    
    // Do any additional setup after loading the view.
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
