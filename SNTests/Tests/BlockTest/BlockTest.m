//
//  BlockTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/5/27.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "BlockTest.h"


@interface BlockTest ()

@end
@implementation BlockTest

- (void)viewDidLoad {
    [super viewDidLoad];
    blk_t blk;
    {
    // Do any additional setup after loading the view
    id array=[[NSMutableArray alloc] init];
    id array2=[[NSMutableArray alloc] init];
    __weak NSMutableArray* weakarray=array;
    __block NSMutableArray* weakarray2=array2;
    blk=^(id obj){
        [weakarray addObject:obj];
        [weakarray2 addObject:obj];
        
        NSLog(@"array:::count:%lu__%lu",(unsigned long)[weakarray count],[weakarray2 count]);
    };
    }
    
    blk([[NSObject alloc] init]);
    blk([[NSObject alloc] init]);
    blk([[NSObject alloc] init]);
    
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
