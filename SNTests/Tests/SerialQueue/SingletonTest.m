
//
// SingletonTest.m
// SNTests
//
// Created by xukaitiankevin on 2016/11/16.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#include "SingletonTest.h"

@implementation SingletonTest
+(id)sharedSingleton
{
    static dispatch_once_t SingletonTestOnce;
    static SingletonTest* sharedSingletonTest;
    dispatch_once(&SingletonTestOnce, ^{
        sharedSingletonTest=[[SingletonTest alloc] init];
        NSLog(@"%@",NSStringFromSelector(_cmd));
    });
    return sharedSingletonTest;
}

@end
