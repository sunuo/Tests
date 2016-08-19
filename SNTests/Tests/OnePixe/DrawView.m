//
//  DrawView.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/19.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "DrawView.h"
#import "Header.h"


@implementation DrawView

-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor  = [UIColor blackColor];
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextMoveToPoint(context, 10, 0);
    CGContextAddLineToPoint(context, 10, self.frame.size.height);
    
    CGContextMoveToPoint(context, 20+1.0f/4.0f, 0);
    CGContextAddLineToPoint(context, 20+1.0f/4.0f, self.frame.size.height);
    CGContextStrokePath(context);
    
    CGContextSetLineWidth(context, 1.0f/kMainScreenScale);
    CGContextMoveToPoint(context, 30, 0);
    CGContextAddLineToPoint(context, 30, self.frame.size.height);
    
    CGContextStrokePath(context);
    
    [self borderWithOneLine:context];
    
}

-(void)borderWithOneLine:(CGContextRef)context
{
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(context, 1.0f/kMainScreenScale);
    
    CGContextStrokePath(context);
}

@end
