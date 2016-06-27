//
//  UIButton+chain.h
//  SNTests
//
//  Created by xukaitiankevin on 16/6/24.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYStripProtocol.h"

@interface UIView(chain)<QYStripProtocol>

//-(id)c_addSubview:(UIView*)view;

-(id)setViewIndex:(NSInteger)index;
-(id)setViewOutsets:(StripEdgeInsets)outsets;
-(id)setViewInsets:(StripEdgeInsets)insets;
-(id)setViewDirection:(StripDirection)direction;
-(id)setViewAutoResize:(BOOL)resize;
-(id)setViewHide:(BOOL)hide;
-(id)setViewFrame:(CGRect)frame;

@end


@implementation UIView(chain)
@dynamic s_direction;//默认为StripDirectionHorizonFromLeft
@dynamic s_insets;//内边缘
@dynamic s_outsets;//外边缘
@dynamic s_index;//唯一标记 用来排序
@dynamic s_hidden;//是否隐藏 用来代替 view hidden
@dynamic s_autoResize;//自动调整大小
@dynamic s_frame;//更改frame

-(id)setViewIndex:(NSInteger)index
{
    self.s_index=index;
    return self;
}
-(id)setViewOutsets:(StripEdgeInsets)outsets
{
    self.s_outsets=outsets;
    return self;
}
-(id)setViewInsets:(StripEdgeInsets)insets
{
    self.s_insets=insets;
    return self;
}

-(id)setViewDirection:(StripDirection)direction
{
    self.s_direction=direction;
    return self;
}

-(id)setViewHide:(BOOL)hide
{
    self.s_hidden=hide;
    return self;
}

-(id)setViewFrame:(CGRect)frame
{
    [self willChangeValueForKey:KVO_S_FRAME];
    self.s_frame=frame;
    [self didChangeValueForKey:KVO_S_FRAME];
    return self;
}
//除了自动resize 其他都需要kvo
-(id)setViewAutoResize:(BOOL)resize
{
    self.s_autoResize=resize;
    return self;
}

//-(id)c_addSubview:(UIView*)view
//{
//    [self addSubview:view];
//    return self;
//}

@end


@interface UIButton (chain)

-(id)c_addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

-(id)c_setTitle:(NSString *)title forState:(UIControlState)state;

-(id)c_setImage:(UIImage *)image forState:(UIControlState)state;

@end


@implementation UIButton (chain)

-(id)c_addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    [self addTarget:target action:action forControlEvents:controlEvents];
    
    return self;
}

-(id)c_setTitle:(NSString *)title forState:(UIControlState)state
{
    [self setTitle:title forState:state];
    
    return self;
}

-(id)c_setImage:(UIImage *)image forState:(UIControlState)state
{
    [self setImage:image forState:state];
    return self;
}
@end