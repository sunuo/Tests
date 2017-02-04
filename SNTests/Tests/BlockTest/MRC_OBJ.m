//
//  MRC_OBJ.m
//  SNTests
//
//  Created by xukaitiankevin on 16/9/27.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "MRC_OBJ.h"
#import "MRCBlockHandler.h"
#import "MRC_OBC2.h"
@implementation MRC_OBJ
{
//    MRC_OBC2* _obc2;
}


-(id)init
{
    if (self=[super init]) {
        
//        self.delegate = self;
        
////        _obc2 = [[MRC_OBC2 alloc] init];
//        __block MRC_OBJ * weakself = self;
////        
////        [[MRCBlockHandler sharedInstace] setHandler:^{
////           
//////            NSLog(@"%@",_delegate);
////            [weakself test];
////            
////        }];
//        
    }
    return self;
}

//-(void)tes
//{
//    NSLog(@"test");
//}

- (void)dealloc
{
    self.delegate = nil;
    NSLog(@"mrc_obc1_dealloc");
    [super dealloc];
}
@end
