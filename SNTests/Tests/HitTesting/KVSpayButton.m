//
//  KVSpayButton.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/4.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "KVSpayButton.h"
#import "Header.h"

@implementation KVSpayButton
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    LOG_SELECTOR;
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    LOG_SELECTOR;
    [super touchesMoved:touches withEvent:event];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    LOG_SELECTOR;
    [super touchesEnded:touches withEvent:event];
}


- (BOOL)beginTrackingWithTouch:(UITouch *)touch
                     withEvent:(UIEvent *)event
{
    return YES;
}
@end
