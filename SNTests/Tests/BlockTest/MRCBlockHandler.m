//
//  MRCBlockHandler.m
//  SNTests
//
//  Created by xukaitiankevin on 16/9/27.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "MRCBlockHandler.h"
static MRCBlockHandler* instance;
@implementation MRCBlockHandler
+(id)sharedInstace
{
    if (instance == nil) {
        instance = [[MRCBlockHandler alloc] init];
    }
    return instance;
}

-(void)handle
{
    self.handler();
}
@end
