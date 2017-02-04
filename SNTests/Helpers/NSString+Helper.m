//
//  NSString+Helper.m
//  SNTests
//
//  Created by xukaitiankevin on 16/10/17.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)
- (NSString *)stringByReplacingString:(NSString *)_orignal
                           withString:(NSString *)_replacement
{
    /* very slow solution .. */
    
    if ([self rangeOfString:_orignal].length == 0)
        return [self copy];
    
    return [[self componentsSeparatedByString:_orignal]
            componentsJoinedByString:_replacement];
}
@end
