//
//  VCUserdefaultest.m
//  SNTests
//
//  Created by xukaitiankevin on 2016/12/15.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCUserdefaultest.h"

@interface VCUserdefaultest ()

@end

@implementation VCUserdefaultest

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self performSelector:@selector(checkUserDefaults) withObject:nil afterDelay:0.001];
    
    NSUserDefaults* defaultu = [NSUserDefaults standardUserDefaults];
    
    [defaultu setValue:@{
                             @"1":@"123",
                             @"2":@"23",
                             @"3":@"3"
                         }
                forKey:@"test"
     ];
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
     [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

-(void)checkUserDefaults
{
   
    NSUserDefaults* defaultu = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"object for test :%@",[defaultu objectForKey:@"test"]);
    
    [self performSelector:@selector(checkUserDefaults) withObject:nil afterDelay:0.001];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
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
