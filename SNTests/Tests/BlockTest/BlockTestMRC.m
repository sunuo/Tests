//
//  BlockTestMRC.m
//  SNTests
//
//  Created by xukaitiankevin on 16/5/27.
//  Copyright © 2016年 ßßßßßßßßßßßßßßßßß徐诺. All rights reserved.
//

#import "BlockTestMRC.h"
#import "MRC_OBJ.h"
#import "MRCBlockHandler.h"
#import "MRC_OBC2.h"
@interface BlockTestMRC()
{
    blk_t _myBlk;
}
@end

@implementation BlockTestMRC
@synthesize delegate = _delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    __block int i =5;
//    blk_t blk;
//    {
//        // Do any additional setup after loading the view
////        id array=[[[NSMutableArr
//        ay alloc] init] autorelease];
////        id array2=[[[NSMutableArray alloc] init] autorelease];
//        
//        id array=[[NSMutableArray alloc] init];
//        id array2=[[NSMutableArray alloc] init];
//        NSMutableArray* weakarray=array;
//        __block NSMutableArray* weakarray2=array2;
//        blk=^(id obj){
////            NSLog(@"%@",[array description]);
//            NSLog(@"%@",[weakarray2 description]);
////            [array addObject:obj];
//            [weakarray2 addObject:obj];
//            
////            NSLog(@"%d array:::count:%lu__%lu",i,(unsigned long)[weakarray count],[weakarray2 count]);
//            NSLog(@"%d array:::count:%lu__",i,[weakarray2 count]);
//        };
//        
//        [array release];
//        [array2 release];
//    }
//////    sleep(5);
////    
//    i =100;
//    blk([[[NSObject alloc] init] autorelease]);
//    blk([[[NSObject alloc] init] autorelease]);
//    blk([[[NSObject alloc] init] autorelease]);
//
    
    MRC_OBJ *mrc = [[MRC_OBJ alloc] init];
    MRC_OBC2 *mrc2 = [[MRC_OBC2 alloc] init];
    mrc.delegate = mrc2;
    self.delegate = mrc2;
    
   // __block BlockTestMRC* weakself = self;
    
    BlockTestMRC* weakself = self;
    
    // id selfweakdelegate = _delegate;
    
    __block id weakdelegate = mrc.delegate;
   //id weakdelegate = mrc.delegate;
    __block MRC_OBJ* weakmrc = mrc;
    __block MRC_OBC2* weakmrc2 = mrc2;
    MRC_OBJ* assignmrc = mrc;
    Handler handle = ^(void){
   //             NSLog(@"......%@",[weakdelegate description]);
//        都释放 无崩溃
  //             NSLog(@"......%@ %@",[mrc.delegate description],mrc2);
        NSLog(@"......%@",_delegate);
//        mrc2释放 无崩溃
//               NSLog(@"......%@",[weakmrc.delegate description]);
//        都释放 野指针
         //   NSLog(@"......%@ %@",[weakmrc description],weakmrc2);
//        都释放 野指针
      //  NSLog(@"......%@",[assignmrc description]);
            };

    [[MRCBlockHandler sharedInstace] setHandler:handle];

    [mrc release];
    [mrc2 release];
    
    _delegate = nil;
    mrc2 = nil;

    [[MRCBlockHandler sharedInstace] handle];
    
    [[MRCBlockHandler sharedInstace] setHandler:nil];

}


-(void)dealloc
{
    NSLog(@"dealloc");
    [super dealloc];
}
@end
