
//
//  VCKVCTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/24.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCKVCTest.h"
#import "OBJKVC.h"
@interface VCKVCTest ()

@end

@implementation VCKVCTest

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    OBJKVC* obj = [[OBJKVC alloc] init];
    
     [obj setValue:@"test" forKey:@"name"];
 
    [self handle:obj];
    
    NSLog(@"%@",obj);
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

-(void)handle:(id)obj
{
    
     [((OBJKVC*)obj) setValue:@"test" forKey:@"hhh"];
    if ([[obj allKeys] containsObject:@"name"]) {
        [obj setValue:@"test" forKey:@"name"];
    }
    if ([[obj allKeys] containsObject:@"xxx"]) {
        [obj setValue:@"xxx" forKey:@"xxx"];
    }
    else
    {
        [obj setValue:@"xxx" forKey:@"xxx"];
    }
    NSLog(@"%@",[obj objectForKey:@"xxx"]);
    
}


@end
