//
//  BlockTestMRC.m
//  SNTests
//
//  Created by xukaitiankevin on 16/5/27.
//  Copyright © 2016年 ßßßßßßßßßßßßßßßßß徐诺. All rights reserved.
//

#import "BlockTestMRC.h"

@interface BlockTestMRC()
{
    blk_t myBlk;
}
@end

@implementation BlockTestMRC

- (void)viewDidLoad {
    [super viewDidLoad];
//    blk_t blk;
//    {
//        // Do any additional setup after loading the view
//        id array=[[NSMutableArray alloc] init];
//        id array2=[[NSMutableArray alloc] init];
//        NSMutableArray* weakarray=array;
//        __block NSMutableArray* weakarray2=array2;
//        blk=^(id obj){
//            [weakarray addObject:obj];
//            [weakarray2 addObject:obj];
//            
//            NSLog(@"array:::count:%lu__%lu",(unsigned long)[weakarray count],[weakarray2 count]);
//        };
//    }
//    
//    blk([[[NSObject alloc] init] autorelease]);
//    blk([[[NSObject alloc] init] autorelease]);
//    blk([[[NSObject alloc] init] autorelease]);
//    
    __block id temp=self;
    myBlk=^(id ddd){
        NSLog(@"me:::%@",temp);
        temp=nil;
    };
    
//    myBlk(@"dd");
}


-(void)dealloc
{
    NSLog(@"dealloc");
    [super dealloc];
}
@end
