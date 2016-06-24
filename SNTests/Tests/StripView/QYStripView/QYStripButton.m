//
//  QYStripButton.m
//  SNTests
//
//  Created by xukaitiankevin on 16/6/23.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "QYStripButton.h"

@implementation QYStripButton
//@synthesize s_Direction;//默认为StripDirectionHorizonFromLeft
//@synthesize s_insets;//内边缘
//@synthesize s_outsets;//外边缘
//@synthesize s_index;//排序标记
//@synthesize s_Hidden;//是否隐藏 用来代替 view hidden
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

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
    self.s_Direction=direction;
    return self;
}

-(id)setViewHide:(BOOL)hide
{
    self.s_Hidden=hide;
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

#pragma mark -- kvo

-(void)setS_index:(NSInteger)s_index
{
    if (s_index!=_s_index) {
        [self willChangeValueForKey:KVO_S_INDEX];
        
        _s_index=s_index;
        
        [self didChangeValueForKey:KVO_S_INDEX];
    }
    
}

-(void)setS_insets:(UIEdgeInsets)s_insets
{
    if (!StripInsetsEqual(_s_insets, s_insets)) {
        
        [self willChangeValueForKey:KVO_S_INSETS];
        _s_insets=s_insets;
        [self didChangeValueForKey:KVO_S_INSETS];
        
    }
}

-(void)setS_outsets:(UIEdgeInsets)s_outsets
{
    if (!StripInsetsEqual(s_outsets, _s_outsets)) {
        
        [self willChangeValueForKey:KVO_S_OUTSETS];
        _s_outsets=s_outsets;
        [self didChangeValueForKey:KVO_S_OUTSETS];
        
    }
}

-(void)setS_Direction:(StripDirection)s_Direction
{
    if (_s_Direction!=s_Direction) {
        
        [self willChangeValueForKey:KVO_S_DIRECTION];
        _s_Direction=s_Direction;
        [self didChangeValueForKey:KVO_S_DIRECTION];
        
        
    }
}

-(void)setS_Hidden:(BOOL)s_Hidden
{//mannual kVO  
    if (_s_Hidden!=s_Hidden) {
        [self willChangeValueForKey:KVO_S_HIDDEN];
        _s_Hidden=s_Hidden;
        self.hidden=s_Hidden;
        [self didChangeValueForKey:KVO_S_HIDDEN];
    }
}

-(void)setS_frame:(CGRect)s_frame
{
    if (!CGRectEqualToRect(s_frame, _s_frame)) {
        [self willChangeValueForKey:KVO_S_FRAME];
        _s_frame=s_frame;
        self.frame=s_frame;
        [self didChangeValueForKey:KVO_S_FRAME];
    }

}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey {
    
    BOOL automatic = NO;
    if ([theKey isEqualToString:KVO_S_HIDDEN]) {
        automatic = NO;
    }
    else {
        automatic = [super automaticallyNotifiesObserversForKey:theKey];
    }
    return automatic;
}

-(void)addStripObject:(UIView<QYStripProtocol>*)view{};
-(UIView<QYStripProtocol>*)objectAtIndex:(NSInteger)index{return nil;};
-(void)removeStripObject:(UIView<QYStripProtocol>*)view{};
-(void)removeStripObjectAtIndex:(NSInteger)index{};
-(void)hideStripObjectAtIndex:(NSInteger)index{};
-(void)hideStripObject:(UIView<QYStripProtocol>*)view{};
-(void)recalculateViewsIfNeeded{};
-(void)removeSelf{};
-(void)adjustToContentSize{};
@end
