

//
//  QYInheritTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/9/8.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "QYInheritTest.h"
#import "Header.h"
@implementation father

+(void)load
{
    LOG_SELECTOR;
}

-(void)hello
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self gun];
}
-(void)gun
{
    NSLog(@"fuck");
    [self bullshit];
}

-(void)bullshit
{
    NSLog(@"father fuck");
}

@end

@implementation son

+(void)load
{
    LOG_SELECTOR;
}

-(void)gun
{
    NSLog(@"fuck you");
    [super gun];
}

-(void)superCall
{
    NSLog(@"super class %@",[super class]);
}

-(void)bullshit
{
    NSLog(@"son fuck");
}
@end

@implementation QYInheritTest
+(void)sayHello
{
    son * sonson =[[son alloc] init];
    [sonson  hello];
    [sonson superCall];
}
@end
