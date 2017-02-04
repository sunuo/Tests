//
//  VCInherit.m
//  SNTests
//
//  Created by xukaitiankevin on 16/9/22.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCInherit.h"
#import "QYInheritTest.h"

@implementation VCInherit
-(id)init
{
    if (self=[super init]) {
        
        [QYInheritTest sayHello];
    }
    return self;
}
@end
