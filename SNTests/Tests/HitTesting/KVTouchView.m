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


@end
