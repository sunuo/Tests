
//
//  VCSimpleTest.m
//  SNTests
//
//  Created by xukaitiankevin on 2016/12/1.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCSimpleTest.h"
#import "Header.h"
@interface VCSimpleTest ()
{
    NSLock* lock;
}
@property(nonatomic,strong)NSMutableArray* mutableArray;

    
@end

@implementation VCSimpleTest

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    lock = [[NSLock alloc] init];
    
    self.mutableArray = [[NSMutableArray alloc] initWithArray:@[@"1",@"2",@"3"]];
    
    __weak VCSimpleTest* ws = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        NSLog(@"add TO ary");
        NSLog(@"___%@",ws.mutableArray);
        [ws.mutableArray addObject:@"4"];
        NSLog(@"add TO ary finish");
        [ws eee];
    });
    
//    NSArray* ary = [NSArray arrayWithArray:mutableArray];
//    for (NSString* str in ary) {
//        NSLog(@"ary:::%@",str);
//        sleep(1);
//    }
    @synchronized (_mutableArray) {
    
        for (NSString* str in self.mutableArray) {
//            [self.mutableArray addObject:@""];
            NSLog(@"ary:::%@",str);
            sleep(1);
        }
    }
    
    
//    [self fff];
    
    [self ddd];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)ddd
{
    @synchronized (self) {
        LOG_SELECTOR;
        [NSThread sleepForTimeInterval:10];
        LOG_SELECTOR;
//        [self eee];
    }
}

-(void)eee
{
    NSLog(@"enter eee");
    @synchronized (self) {
        LOG_SELECTOR;
    }
    
    NSLog(@"hhhhhhhh---");
}


-(void)fff
{
    @synchronized (self) {
        
        
        LOG_SELECTOR;
        [self fff];
        
       NSLog(@"exit");
    }
    
       NSLog(@"exit----");
}

-(void)ggg
{
    [lock lock];
    
    LOG_SELECTOR;
    
    [self ggg];
    
    [lock unlock];
    
    NSLog(@"exit");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSMutableArray*)mutableArray
{
    @synchronized (_mutableArray) {
    if (_mutableArray) {
//        @synchronized (_mutableArray) {
            return _mutableArray;
//        }
    }
    return _mutableArray;
    }
}
@end
