//
// QYVideoRelatedSingleton.m
// SNTests
//
// Created by xukaitiankevin on 2017/7/25.
//  Copyright © 2017年 徐诺. All rights reserved.
//

#include "QYVideoRelatedSingleton.h"

@implementation QYVideoRelatedSingleton
+(id)sharedSingleton
{
    static dispatch_once_t QYVideoRelatedSingletonOnce;
    static QYVideoRelatedSingleton* sharedQYVideoRelatedSingleton;
    dispatch_once(&QYVideoRelatedSingletonOnce, ^{
        sharedQYVideoRelatedSingleton=[[QYVideoRelatedSingleton alloc] init];
        NSLog(@"%@",NSStringFromSelector(_cmd));
    });
    return sharedQYVideoRelatedSingleton;
}

@end
