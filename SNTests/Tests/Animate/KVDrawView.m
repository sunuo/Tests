
//  KVDrawView.m
//  SNTests
//
//  Created by xukaitiankevin on 16/9/1.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "KVDrawView.h"
#import "Header.h"
@implementation KVDrawView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)drawRect:(CGRect)rect
{
    
    CGRect frame = self.frame;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGAffineTransform ctm = CGContextGetCTM(context);
    CGAffineTransform ctm1 = CGContextGetUserSpaceToDeviceSpaceTransform(context);
    
    CGContextSetFillColorWithColor(context, [[UIColor greenColor] CGColor]);
    CGContextFillRect(context,self.bounds);
    
    //  改变的是其内部画版的坐标及旋转，对控件本身占有的区域无影响、对旋转之前的绘制无影响
    CGContextRotateCTM(context,M_PI/6);
    
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(context,self.bounds);

//    CGContextTranslateCTM(context, ctm.tx+CGRectGetWidth(frame), ctm.ty);
//    CGContextConcatCTM(context, CGAffineTransformMake(-1, 0, 0, 1, CGRectGetWidth(frame), 0));
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, CGRectGetWidth(frame)/2, +10);
    CGContextAddLineToPoint(context, CGRectGetWidth(frame)/2, CGRectGetHeight(frame)-10);
//    勾对角
//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, CGRectGetWidth(frame), CGRectGetHeight(frame));
    CGContextStrokePath(context);
    
    
    CGContextSetFillColorWithColor(context, [[UIColor orangeColor] CGColor]);
    CGContextFillRect(context, CGRectMake(CGRectGetWidth(frame)/2-10, CGRectGetHeight(frame)/2-10, 20, 20));
    
    
}
@end
