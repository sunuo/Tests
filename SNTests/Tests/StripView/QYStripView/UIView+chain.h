//
//  UIButton+chain.h
//  SNTests
//
//  Created by xukaitiankevin on 16/6/24.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (chain)

-(id)c_addSubview:(UIView*)view;

@end


@implementation UIView (chain)

-(id)c_addSubview:(UIView*)view
{
    [self addSubview:view];
    return self;
}

@end


@interface UIButton (chain)

-(id)c_addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

-(id)c_setTitle:(NSString *)title forState:(UIControlState)state;

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
@end