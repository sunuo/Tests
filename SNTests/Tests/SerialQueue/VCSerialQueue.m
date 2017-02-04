//
//  VCSerialQueue.m
//  SNTests
//
//  Created by xukaitiankevin on 2016/11/15.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCSerialQueue.h"
#import "Thread.h"
static dispatch_queue_t _taskQueue;
@interface VCSerialQueue ()
@property(nonatomic,retain)ThreadWrapper* threadWrapper;
@end

@implementation VCSerialQueue

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

-(void)appEnterBackground:(id)notification
{
    dispatch_async([VCSerialQueue  upnpOperationQueue], ^{
        NSLog(@"back %@_%@",[NSThread currentThread],[NSThread isMainThread]?@"main":@"no_main");
        
    });

}

-(void)appEnterForground:(id)notification
{
    dispatch_async([VCSerialQueue  upnpOperationQueue], ^{
        
        [self.threadWrapper  start];
        //        sleep(1);
        NSLog(@"fore %@_%@",[NSThread currentThread],[NSThread isMainThread]?@"main":@"no_main");
        
    });

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appEnterForground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];

    self.threadWrapper = [[[ThreadWrapper alloc] init] autorelease];
    
    dispatch_async([VCSerialQueue  upnpOperationQueue], ^{
        
        [self.threadWrapper  start];
//        sleep(1);
        NSLog(@"1 %@_%@",[NSThread currentThread],[NSThread isMainThread]?@"main":@"no_main");
    
    });
    
    
//
//    [self performSelector:@selector(execute2) withObject:nil afterDelay:5];
//    
    [self performSelector:@selector(execute3) withObject:nil afterDelay:5];
//
    
//    [self performSelector:@selector(execReleaseQueue) withObject:nil afterDelay:3];
    
//    [self execReleaseQueue];
    
    dispatch_async([VCSerialQueue  upnpOperationQueue], ^{
//        sleep(1);
//        [self.threadWrapper  start];
        NSLog(@"3 %@_%@",[NSThread currentThread],[NSThread isMainThread]?@"main":@"no_main");
         
    });
    dispatch_async([VCSerialQueue  upnpOperationQueue], ^{
        [self.threadWrapper  stop];
//        sleep(10);
        NSLog(@"4 %@_%@",[NSThread currentThread],[NSThread isMainThread]?@"main":@"no_main");
    
    });
    dispatch_async(dispatch_get_main_queue(),^{
                   
                   dispatch_async([VCSerialQueue  upnpOperationQueue], ^{
                       
                   [self.threadWrapper  stop];
                       
                   sleep(1);
        
                   NSLog(@"5 %@_%@",[NSThread currentThread],[NSThread isMainThread]?@"main":@"no_main");
                   
                    
        
                   });
    });

//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
//        
//        dispatch_async([VCSerialQueue  upnpOperationQueue], ^{
//            
//            sleep(1);
//            
//            NSLog(@"6 %@_%@",[NSThread currentThread],[NSThread isMainThread]?@"main":@"no_main");
//            
//             
//            
//        });
//    });

    // Do any additional setup after loading the view.
}

-(void)execReleaseQueue
{
    NSLog(@"release queue");
    dispatch_release([VCSerialQueue  upnpOperationQueue]);
    _taskQueue = nil;
}

-(void)execute2
{
    dispatch_async([VCSerialQueue  upnpOperationQueue], ^{
        sleep(1);
        NSLog(@"2 %@_%@",[NSThread currentThread],[NSThread isMainThread]?@"main":@"no_main");
    });
}

-(void)execute3
{
    dispatch_async([VCSerialQueue  upnpOperationQueue], ^{
        sleep(1);
        NSLog(@"exc 3 %@_%@",[NSThread currentThread],[NSThread isMainThread]?@"main":@"no_main");
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//static dispatch_once_t SingletonTestOnce;
//static SingletonTest* sharedSingletonTest;
//dispatch_once(&SingletonTestOnce, ^{
//    sharedSingletonTest=[[SingletonTest alloc] init];
//    NSLog(@"%@",NSStringFromSelector(_cmd));
//});
//return sharedSingletonTest;


+(dispatch_queue_t)upnpOperationQueue {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _taskQueue = dispatch_queue_create("com.iqiyi.dlna", DISPATCH_QUEUE_SERIAL);
        NSLog(@"dddd");
    });
    return _taskQueue;
    
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
