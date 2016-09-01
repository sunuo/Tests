//
//  UIView+Draw.m
//  SNTests
//
//  Created by xukaitiankevin on 16/9/1.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "UIView+Draw.h"

@implementation UIView (Draw)

-(CGContextRef)getCurrentContext
{
    return UIGraphicsGetCurrentContext();
}

@end
