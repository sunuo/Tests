//
//  VWTansverse.m
//  SNTests
//
//  Created by xukaitiankevin on 16/7/16.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VWTansverse.h"

@implementation VWTansverse

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return nil;
    NSLog(@"name:::%@___%@",self.name,NSStringFromSelector(_cmd));
    return [super hitTest:point withEvent:event];
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"name:::%@___%@",self.name,NSStringFromSelector(_cmd));
    return [super pointInside:point withEvent:event];
}


@end
