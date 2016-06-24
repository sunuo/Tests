


//
//  KVOView.m
//  SNTests
//
//  Created by xukaitiankevin on 16/6/24.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "KVOView.h"

@implementation KVOView

-(void)setViewFrame:(CGRect)frame
{
    [self willChangeValueForKey:KVOFrame];
    self.frame=frame;
    viewFr=frame;
    [self didChangeValueForKey:KVOFrame];
}

-(CGRect)viewFrame
{
    return viewFr;
}

-(void)setViewHidden:(BOOL)hidden
{
    [self willChangeValueForKey:KVOHidden];
    self.hidden=hidden;
    _viewHidden=hidden;
    [self didChangeValueForKey:KVOHidden];
}

+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
    if ([key isEqualToString:KVOHidden]||[key isEqualToString:KVOFrame]) {
        return NO;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}
@end
