
//
//  VCDecouple.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/8.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCDecouple.h"

@implementation VCDecouple


-(void)decouple:(id)sender test:(id)data message:(id)message
{
    if ([self.delegate respondsToSelector:@selector(decouple:test:message:)]) {
        [self.delegate decouple:self test:data message:message];
    }
}

-(void)registerSelector:(SEL)selector
{
    
}

@end
