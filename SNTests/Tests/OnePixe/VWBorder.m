//
//  VWBorder.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/20.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VWBorder.h"
#import "Header.h"

@implementation VWBorder

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)resizeForBorder
{
    self.frame=[self getResizeRect:self.frame];
}

-(CGRect)getResizeRect:(CGRect)rect
{
    CGFloat top=CGRectGetMinY(rect)*kMainScreenScale;
    CGFloat left=CGRectGetMinX(rect)*kMainScreenScale;
    CGFloat right=CGRectGetMaxX(rect)*kMainScreenScale;
    CGFloat bottom=CGRectGetMaxY(rect)*kMainScreenScale;
    
    
    CGFloat re_top = (CGFloat)[self getIntValue:top];
    CGFloat re_left = (CGFloat)[self getIntValue:left];
    CGFloat re_right = (CGFloat)[self getIntValue:right];
    CGFloat re_bottom = (CGFloat)[self getIntValue:bottom];
    
    return CGRectMake(re_left/kMainScreenScale, re_top/kMainScreenScale, (re_right-re_left)/kMainScreenScale,(re_bottom-re_top)/kMainScreenScale);
    
}

-(NSInteger)getIntValue:(CGFloat)value
{//获取最接近整数
    CGFloat floatValue = value - (NSInteger)value;
    if (floatValue<=0.01) {//可以认为是0
        return (NSInteger)value;
    }
    else if(floatValue<0.5)
    {
        return (NSInteger)value;
    }
    else
    {
        return ((NSInteger)value)+1;
    }
    
}

@end
