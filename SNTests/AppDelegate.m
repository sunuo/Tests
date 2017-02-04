//
//  AppDelegate.m
//  SNTests
//
//  Created by kevin on 15/8/30.
//  Copyright (c) 2015年 徐诺. All rights reserved.
//

#import "AppDelegate.h"
#import "NSLayoutConstraint+Extentsion.h"
#import "LayoutConstriantExtentsion.h"
#import "Aspects.h"
#import "NSString+Helper.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

    NSError* error = nil;
    
    NSInteger width = 1;
    NSInteger height = 2;
    
   CGFloat widthDivHeight = ((CGFloat)width)/((CGFloat)height);
    CGFloat wdh = width/height;
    
    
    NSLog(@"%@",[[NSNumber numberWithInt:5] isEqualToNumber:[NSNumber numberWithInt:5]]?@"5=5":@"5!=5");
    NSLog(@"%@",[[NSNumber numberWithInt:5] isEqualToNumber:[NSNumber numberWithInt:4]]?@"5=4":@"5!=4");
    
    [NSClassFromString(@"VCTransformTest") aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^{
        
        NSLog(@"当一颗心沉入海底");
        
    } error:&error];
    
    if (error) {
        NSLog(@"aspect error ::: %@",error);
    }
    
    NSTimeInterval interval  =[[NSDate date] timeIntervalSince1970] * 1000;
    NSLog(@"%lf %lu",interval,((NSUInteger)interval));
    
    NSString* urlStr = @"http://static.iqiyi.com/ext/cupid/lp/57ec9161cd7ae9c14cee3b81.html&cct=[CUPID_CLTIME]";
    NSString* AD_CONSTANT_CUPID_CLTIME = @"[CUPID_CLTIME]";
//    if([urlStr containsString:AD_CONSTANT_CUPID_CLTIME])
    if([urlStr rangeOfString:AD_CONSTANT_CUPID_CLTIME].location!=NSNotFound)
    {
        urlStr = [urlStr stringByReplacingString:AD_CONSTANT_CUPID_CLTIME withString:[NSString stringWithFormat:@"%lu",((NSUInteger)interval)]];
    }
//    for (NSInteger i = 0; i<[array count]; i++) {
//        
//        NSString* STR = [array objectAtIndex:i];
//        NSLog(@"array count %lu current index %lu STR:::%@",(unsigned long)[array count],(unsigned long)[array indexOfObject:STR],STR);
//        [array removeObject:STR];
//        NSLog(@"array count %lu",(unsigned long)[array count]);
//    }
    
//    NSString* URL = @"http://static.iqiyi.com/ext/cupid/lp/57ec9161cd7ae9c14cee3b81.html&cct=[CUPID_CLTIME]";
//    if([URL containsString:AD_CONSTANT_CUPID_CLTIME])
//    {
//        [URL stringByReplacingString:AD_CONSTANT_CUPID_CLTIME withString:[NSString stringWithFormat:@"%ld",(NSInteger)([[NSDate date] timeIntervalSince1970] * 1000)]];
//    }
//    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
