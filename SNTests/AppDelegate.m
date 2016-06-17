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
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
  
        NSArray *languages = [NSLocale preferredLanguages];
        NSString *currentLanguage = [languages objectAtIndex:0];
        NSLog( @"%@\n: %@" , languages,currentLanguage);
        
//    }
    // Override point for customization after application launch.
//    NSDictionary* dicview=@{@"v1":[[UIView alloc] init],@"v2":[[UIView alloc] init]};

//    [NSLayoutConstraint constraintWithFixedAspectRatio:@"v1.Left>v2.Left*3.2+2.1" views:dicview];
//    [NSLayoutConstraint constraintWithFixedAspectRatio:@"v1.Right>v2.Right*3+2.1" views:dicview];
//    [NSLayoutConstraint constraintWithFixedAspectRatio:@"v1.Top<v2.Top*3.2+2" views:dicview];
//    [NSLayoutConstraint constraintWithFixedAspectRatio:@"v1.Bottom<v2.Bottom*3" views:dicview];
//    [NSLayoutConstraint constraintWithFixedAspectRatio:@"v1.Leading=v2.Leading+2.9" views:dicview];
//    [NSLayoutConstraint constraintWithFixedAspectRatio:@"v1.Trailing=v2.Trailing" views:dicview];
    
  
//    
//    NSArray* aryStrings=@[@"v1.Left>v2.Left*3.2+2.1",
//                          @"v1.Right>v2.Right*3+2.1",
//                          @"_v1._Top<v2.Top*3.2+2",
//                          @"v1.Bottom<v2._Bottom*3",
//                          @"v1.Leading=v2_.Leading+2.9",
//                          @"v1.Trailing=_v2.Trailing",
//                          
//                          @"_v1.Left>_v2.Left*3.2+2.1",
//                          @"v1.Left=_v2.Left*3.2f+2.0f",
//                          @"_v1.Left=_v2.Left*3.+2.0f",
//                          @"v1.Left>v2.Left*3.2",
//                          @"v1.Left<_v2.Left",
//                          @"3451.Left<v2.Left",
//                          @"12w.Left<v2.Left",
//                          
//                          @"_v1.Left>_v2.Left*3.2+2.1",
//                          
//                          @".Left>v2.Left",
//                          @"self.v1.Left>v2.Left",
//                          @"self.v1.Left>self.v2.Left",
//                          @"self.v1.Left>=self.v2.Left",
//                          @"v1.Left>self.v2.Left",
//                          @"v1.Left=3*v2.Left+2",
//                          @"v1.Left+4*v2.Lef",
//                          @"|[dd]-[ee]|",
//                          @"=4*v2.Lef",];
//    NSString* varibles=@"[a-zA-Z_][a-zA-Z0-9_]*";
//    NSString* objectWithAttribute=[NSString stringWithFormat:@"%@%@%@",varibles,@"\\.",varibles];//@"([[a-z][A-Z][0-9]]+\\.[[a-z][A-Z][0-9]]+)";
////    NSString* compareOperation=@">|=|<";
//    NSString* compareOperation0=@"[><=]";
////    NSString* regfloat=@"[0-9]+(\\.[0-9]+f?)?";
//    NSString* multifloat=@"(\\*[0-9]+(\\.[0-9]+f?)?)?";
//    NSString* addConstant=@"(\\+[0-9]+(\\.[0-9]+f?)?)?";
//    
//    NSString* reg=[NSString stringWithFormat:@"%@%@%@%@%@",objectWithAttribute,compareOperation0,objectWithAttribute,multifloat,addConstant];
//
//    
//    NSRegularExpression* regex=[NSRegularExpression regularExpressionWithPattern:Pattern options:NSRegularExpressionCaseInsensitive error:nil];
//    NSLog(@"%@",regex.pattern);
//    for (NSString* aString in aryStrings) {
//        
//       
//
//            NSUInteger numberOfMatches = [regex numberOfMatchesInString:aString
//                                                                options:0
//                                                                  range:NSMakeRange(0, [aString length])];
//            
//            if(numberOfMatches==0)
//            {
//                NSLog(@"NO:::%@",aString);
//            }
//            else
//            {
//                NSLog(@"YES_%lu:::%@",(unsigned long)numberOfMatches,aString);
//            }
//    }
//    
//    NSLog(@"%f %f",[@"3." floatValue],[@"3.4f" floatValue]);
    
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
