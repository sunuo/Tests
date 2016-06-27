//
//  QYStripViewContainer.m
//  SNTests
//
//  Created by xukaitiankevin on 16/6/22.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "QYStripViewContainer.h"

@implementation QYStripViewContainer
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

-(void)dealloc
{
    [self removeSelf];
}

-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
//        self.s_direction=StripDirectionHorizonFromLeft;
        _s_autoResize=YES;
        
#if DEBUG
        [self setBackgroundColor:[UIColor lightGrayColor]];
        self.alpha=0.5;
#else
        [self setBackgroundColor:[UIColor clearColor]];
#endif
        
        _viewArray=[[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addStripObject:(UIView<QYStripProtocol>*)view
{
    if ([_viewArray containsObject:view]) {
        return;
    }
    [_viewArray addObject:view];
    
    [view  addObserver:self forKeyPath:KVO_S_HIDDEN options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [view  addObserver:self forKeyPath:KVO_S_FRAME options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    
    [self addSubview:view];
    
    [self recalculateViewsIfNeeded];
}

-(UIView<QYStripProtocol>*)objectAtIndex:(NSInteger)index
{
    for (UIView<QYStripProtocol> * view in _viewArray) {
        
        if (view.s_index==index) {
            return view;
        }
    }
    
    return nil;
}

-(void)removeStripObject:(UIView<QYStripProtocol> *)view
{
    if ([_viewArray containsObject:view]) {
        
        [view removeObserver:self forKeyPath:KVO_S_HIDDEN context:NULL];
        [view removeObserver:self forKeyPath:KVO_S_FRAME context:NULL];
        
        [view removeFromSuperview];
    }
    
    [self recalculateViewsIfNeeded];
}

-(void)removeStripObjectAtIndex:(NSInteger)index
{
        
    id view = [self objectAtIndex:index];
    if (view) {
       [self removeStripObject:view];
    }
}

-(void)recalculateViewsIfNeeded
{
    [_viewArray sortUsingComparator:^NSComparisonResult(id  <QYStripProtocol> obj1, id  <QYStripProtocol> obj2) {
        NSInteger number1 = obj1.s_index;
        NSInteger number2 = obj2.s_index;
        
        if (number1>number2)
            return NSOrderedDescending;
        else
            return NSOrderedAscending;
    }];
    
    //
    UIView<QYStripProtocol>* preView=nil;
    UIView<QYStripProtocol>* currentView=nil;
    for (int i=0; i<_viewArray.count; i++) {
        
        currentView=_viewArray[i];
        
        if (!currentView.s_hidden) {
            
            //动画
            [UIView animateWithDuration:0.1  animations:^{
                
                currentView.frame = [self reposViewFrame:currentView byPreview:preView];
                
            }];
            
            preView=currentView;//保证preview不为hidden

        }
        
    }
    if(self.s_autoResize)
        [self adjustToContentSize];
}

-(void)setS_autoResize:(BOOL)s_autoResize
{
    if (s_autoResize!=_s_autoResize) {
        
        _s_autoResize=s_autoResize;
        
        if (_s_autoResize) {
            [self recalculateViewsIfNeeded];
        }
        
    }
}

-(UIView<QYStripProtocol>*)firstView
{
    for (UIView<QYStripProtocol>*  vw in _viewArray) {
        if (!vw.s_hidden) {
            return vw;
        }
    }
    return nil;
}

-(UIView<QYStripProtocol>*)lastView
{
    for (NSInteger i=[_viewArray count]-1; i>=0; i--) {
        if (!((UIView<QYStripProtocol>*)_viewArray[i]).s_hidden) {
            return _viewArray[i];
        }
    }
    return nil;
}

-(void)adjustToContentSize
{
    BOOL emptyOrAllHide=NO;
    UIView<QYStripProtocol>* lastView= [self lastView];
    UIView<QYStripProtocol>* firstView= [self firstView];
    
    if (_viewArray.count<=0||lastView==nil||firstView==nil) {
        emptyOrAllHide=YES;
    }
    CGRect oldSuperFrame= self.frame;
    CGRect lastViewFrame= lastView.frame;
    CGRect firstViewFrame= firstView.frame;
    switch (self.s_direction) {
        case StripDirectionHorizonFromLeft:{//左到右扩展，第一个处于最边
            if (emptyOrAllHide) {
                oldSuperFrame.size.width=0;
            }
            else
                oldSuperFrame.size.width=CGRectGetMaxX(lastViewFrame)+lastView.s_outsets.right+self.s_insets.right;
        }break;
        case StripDirectionHorizonFromRight:{//右到左扩展，第一个处于最边
            if (emptyOrAllHide) {
                oldSuperFrame.origin.x= CGRectGetMaxX(oldSuperFrame)
                oldSuperFrame.size.width=0;
            }
            else
            {
                oldSuperFrame.size.width=CGRectGetMaxX(firstViewFrame)+self.s_insets.right+firstView.s_outsets.right;
                oldSuperFrame.origin.x= CGRectGetMaxX(oldSuperFrame)-oldSuperFrame.size.width;
            }
        }break;
        case StripDirectionVerticaFromlTop:{//上到下扩展，第一个处于最边
            if (emptyOrAllHide) {
                oldSuperFrame.size.height=0;
            }
            else
                oldSuperFrame.size.height=CGRectGetMaxY(lastViewFrame)+self.s_insets.bottom+lastView.s_outsets.bottom;
        }break;
        case StripDirectionVerticaFromlBottom:{//下到上扩展，第一个处于最边
            if (emptyOrAllHide) {
                oldSuperFrame.origin.y=CGRectGetMaxY(oldSuperFrame);
                oldSuperFrame.size.height=0;
                
            }
            else{
                oldSuperFrame.size.height=CGRectGetMaxY(firstView.frame)+self.s_insets.bottom+firstView.s_outsets.bottom;
                oldSuperFrame.origin.y=CGRectGetMaxY(oldSuperFrame)-oldSuperFrame.size.height;
            }
            
        }break;
        default:break;
    }
    self.frame=oldSuperFrame;
}

-(CGRect)reposViewFrame:(UIView<QYStripProtocol>*)currentView byPreview:(UIView<QYStripProtocol>*)preView
{
    StripEdgeInsets superInsets = self.s_insets;
    
    StripEdgeInsets preoutset = preView.s_outsets;
    CGRect preFrame = preView.frame;
    
    StripEdgeInsets curoutset = currentView.s_outsets;
    CGRect curFrame=currentView.frame;
    
    switch (self.s_direction) {
        case StripDirectionHorizonFromLeft:{//左到右扩展，第一个处于最边
            
            if (preView==nil) {//第一个
                preFrame=CGRectZero;
                preoutset=StripInsets(0, 0, 0, 0);
                preoutset.right=superInsets.left;
            }
            
            curFrame=CGRectMake(CGRectGetMaxX(preFrame)+preoutset.right+curoutset.left,
                                (CGRectGetHeight(self.frame)-curFrame.size.height)/2,//curoutset.top,
                                curFrame.size.width,
                                curFrame.size.height);
        }break;
        case StripDirectionHorizonFromRight:{//右到左扩展，第一个处于最边
            
            if (preView==nil) {//第一个
                preFrame=CGRectMake(CGRectGetWidth(self.frame), 0, 0, 0);
                preoutset=StripInsets(0, 0, 0, 0);
                preoutset.left=superInsets.right;
            }
            
            curFrame=CGRectMake(CGRectGetMinX(preFrame)-preoutset.left-curoutset.right-curFrame.size.width,
                                (CGRectGetHeight(self.frame)-curFrame.size.height)/2,//curoutset.top,
                                curFrame.size.width,
                                curFrame.size.height);
            
        }break;
        case StripDirectionVerticaFromlTop:{//上到下扩展，第一个处于最边
            
            if (preView==nil) {//第一个
                preFrame=CGRectZero;
                preoutset=StripInsets(0, 0, 0, 0);
                preoutset.bottom=superInsets.top;
            }
            
            curFrame=CGRectMake((CGRectGetWidth(self.frame)-curFrame.size.width)/2,//curoutset.left,
                                CGRectGetMaxY(preFrame)+preoutset.bottom+curoutset.top,
                                curFrame.size.width,
                                curFrame.size.height);
            
        }break;
        case StripDirectionVerticaFromlBottom:{//下到上扩展，第一个处于最边
            
            if (preView==nil) {//第一个
                preFrame=CGRectMake(0, CGRectGetHeight(self.frame), 0, 0);
                preoutset=StripInsets(0, 0, 0, 0);
                preoutset.top=superInsets.bottom;
            }

            curFrame=CGRectMake((CGRectGetWidth(self.frame)-curFrame.size.width)/2,//curoutset.left,
                                CGRectGetMinY(preFrame)-preoutset.top-curoutset.bottom-curFrame.size.height,
                                curFrame.size.width,
                                curFrame.size.height);

            
        }break;
        default:break;
    }
    
    return curFrame;
    
}

-(void)hideStripObjectAtIndex:(NSInteger)index//隐藏控件
{
    id view = [self objectAtIndex:index];
    if (view) {
        [self hideStripObject:view];
    }
}

-(void)hideStripObject:(UIView<QYStripProtocol> *)view
{
    if ([_viewArray containsObject:view]) {
        
        view.s_hidden=YES;
    }
}

-(void)removeSelf
{
    for (UIView<QYStripProtocol> * view in _viewArray) {
        
        if ([_viewArray containsObject:view]) {
            
            [view removeObserver:self forKeyPath:KVO_S_HIDDEN context:NULL];
            [view removeObserver:self forKeyPath:KVO_S_FRAME context:NULL];

        }
    }
    [_viewArray removeAllObjects];
}

-(void)removeAll
{
    for (UIView<QYStripProtocol> * view in _viewArray) {
        
        if ([_viewArray containsObject:view]) {
            
            [view removeObserver:self forKeyPath:KVO_S_HIDDEN context:NULL];
            [view removeObserver:self forKeyPath:KVO_S_FRAME context:NULL];
            [view removeFromSuperview];
            
        }
    }
    [_viewArray removeAllObjects];
    [self adjustToContentSize];
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:KVO_S_HIDDEN]||[keyPath isEqualToString:KVO_S_FRAME]) {
        
        [self recalculateViewsIfNeeded];
        
    }
    else if( [keyPath isEqualToString:KVO_S_OUTSETS]||
            [keyPath isEqualToString:KVO_S_DIRECTION]||
            [keyPath isEqualToString:KVO_S_HIDDEN]||
            [keyPath isEqualToString:KVO_S_INDEX])
    {
        
    }
    else
    {
        if ([super respondsToSelector:@selector(observeValueForKeyPath:ofObject:change:context:)]) {
              [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
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

-(void)setS_direction:(StripDirection)s_Direction
{
    if (_s_direction!=s_Direction) {
        
        [self willChangeValueForKey:KVO_S_DIRECTION];
        _s_direction=s_Direction;
        [self didChangeValueForKey:KVO_S_DIRECTION];
        
        
    }
}

-(void)setS_hidden:(BOOL)s_Hidden
{//mannual kVO
    if (_s_hidden!=s_Hidden) {
        [self willChangeValueForKey:KVO_S_HIDDEN];
        _s_hidden=s_Hidden;
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
    if ([theKey isEqualToString:KVO_S_FRAME]||
        [theKey isEqualToString:KVO_S_INSETS]||
        [theKey isEqualToString:KVO_S_OUTSETS]||
        [theKey isEqualToString:KVO_S_DIRECTION]||
        [theKey isEqualToString:KVO_S_HIDDEN]||
        [theKey isEqualToString:KVO_S_INDEX]
        ) {
        automatic = NO;
    }
    else {
        automatic = [super automaticallyNotifiesObserversForKey:theKey];
    }
    return automatic;
}
@end
