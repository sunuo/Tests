//
//  KVTouchExpandView.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/15.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "KVTouchExpandView.h"

@implementation KVTouchExpandView


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint parentLocation = [self convertPoint:point toView:[self superview]];
    CGRect expandRect = self.frame;
    expandRect.origin.x -= _expandInset.left;
    expandRect.origin.y -= _expandInset.top;
    expandRect.size.width += (_expandInset.left + _expandInset.right);
    expandRect.size.height += (_expandInset.top + _expandInset.bottom);
    
    return CGRectContainsPoint(expandRect, parentLocation);
}

@end
