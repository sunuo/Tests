//
//  KVTouchView.m
//  SNTests
//
//  Created by xukaitiankevin on 16/7/9.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "KVTouchView.h"
#import "Header.h"

@implementation KVTouchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.name) {
        NSLog(@"---%@",self.name);
    }
    LOG_SELECTOR;
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.name) {
        NSLog(@"---%@",self.name);
    }
    LOG_SELECTOR;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.name) {
        NSLog(@"---%@",self.name);
    }
    LOG_SELECTOR;
}



- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    if(self.hidden||self.userInteractionEnabled==NO||self.alpha<0.01)
    {/*此处见文档
      This method ignores view objects that are hidden, that have disabled user interactions, or have an alpha level less than 0.01.
      */
        return nil;
    }
    
    if (![self pointInside:point withEvent:event]) {
        return nil;//如果这个点不在本身处理范围内，返回nil
    }
    
    NSArray* sortedSubViews=[self subviews];/*对subview按照index由大到小排序,index为视图层级，0为添加的第一个视图*/;
    
    for (UIView* subview in sortedSubViews) {
        
        //将父视图的坐标点转换为子视图坐标点
        CGPoint covertPoint=[self convertPoint:point toView:subview];
        
        //递归子视图
        UIView* hitView=[subview hitTest:covertPoint withEvent:event];
        
        if (hitView) {
            return hitView;
        }
        
    }
    return self;
}

@end
