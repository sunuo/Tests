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
        
        self.s_Direction=StripDirectionHorizonFromLeft;
        self.s_autoResize=YES;
        
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
        
        if (!currentView.s_Hidden) {
            
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

-(void)adjustToContentSize
{
    if (_viewArray.count<=0) {
        return;
    }
    UIView<QYStripProtocol>* lastView= [_viewArray lastObject];
    UIView<QYStripProtocol>* firstView= [_viewArray firstObject];
    CGRect oldSuperFrame= self.frame;
    CGRect lastViewFrame= lastView.frame;
    CGRect firstViewFrame= firstView.frame;
    switch (self.s_Direction) {
        case StripDirectionHorizonFromLeft:{//左到右扩展，第一个处于最边
            oldSuperFrame.size.width=CGRectGetMaxX(lastViewFrame);
        }break;
        case StripDirectionHorizonFromRight:{//右到左扩展，第一个处于最边
            oldSuperFrame.origin.x=CGRectGetMinX(lastViewFrame);
            oldSuperFrame.size.width=CGRectGetMaxX(firstViewFrame)+self.s_insets.right+firstView.s_outsets.right;
        }break;
        case StripDirectionVerticaFromlTop:{//上到下扩展，第一个处于最边
            oldSuperFrame.size.height=CGRectGetMaxY(lastViewFrame);
        }break;
        case StripDirectionVerticaFromlBottom:{//下到上扩展，第一个处于最边
            oldSuperFrame.origin.y=CGRectGetMinY(lastViewFrame);
            oldSuperFrame.size.height=CGRectGetMaxY(firstView.frame)+self.s_insets.bottom+firstView.s_outsets.bottom;
            
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
    
    switch (self.s_Direction) {
        case StripDirectionHorizonFromLeft:{//左到右扩展，第一个处于最边
            
            if (preView==nil) {//第一个
                preFrame=CGRectZero;
                preoutset=StripInsets(0, 0, 0, 0);
                preoutset.right=superInsets.left;
            }
            
            curFrame=CGRectMake(CGRectGetMaxX(preFrame)+preoutset.right+curoutset.left,
                                curoutset.top,
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
                                curoutset.top,
                                curFrame.size.width,
                                curFrame.size.height);
            
        }break;
        case StripDirectionVerticaFromlTop:{//上到下扩展，第一个处于最边
            
            if (preView==nil) {//第一个
                preFrame=CGRectZero;
                preoutset=StripInsets(0, 0, 0, 0);
                preoutset.bottom=superInsets.top;
            }
            
            curFrame=CGRectMake(curoutset.left,
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

            curFrame=CGRectMake(curoutset.left,
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
        
        view.s_Hidden=YES;
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


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:KVO_S_HIDDEN]) {
        
        [self recalculateViewsIfNeeded];
        
    }
    else
    {
        if ([super respondsToSelector:@selector(observeValueForKeyPath:ofObject:change:context:)]) {
              [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
}

-(void)setS_Hidden:(BOOL)s_Hidden
{
    if (_s_Hidden!=s_Hidden) {
        [self willChangeValueForKey:KVO_S_HIDDEN];
        _s_Hidden=s_Hidden;
        self.hidden=s_Hidden;
        [self didChangeValueForKey:KVO_S_HIDDEN];
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
@end
