//
//  VWTransparent.m
//  SNTests
//
//  Created by xukaitiankevin on 16/7/16.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VWTransparent.h"

@implementation VWTransparent

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView* view=[super hitTest:point withEvent:event];
    if (view==self) {
        view = nil;
    }
    return view;
}

//-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
//{
//
//    for (UIView* subview in [self subviews]) {
//        if (CGRectContainsPoint(subview.frame, point)) {
//            return YES;
//        }
//    }
//    return NO;
//}

@end
