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
    
//    NSString* tempSecond = nil;
//    NSDictionary *dictAttr0 = @{NSFontAttributeName:[UIFont systemFontOfSize:10.0f],NSForegroundColorAttributeName:[UIColor redColor]};
//    NSAttributedString *attr0 = [[NSAttributedString alloc] initWithString:tempSecond
//                                                                attributes:dictAttr0];
    
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
