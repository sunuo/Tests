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

-(void)setS_Hidden:(BOOL)s_Hidden
{//mannual kVO  
    if (_s_Hidden!=s_Hidden) {
        [self willChangeValueForKey:@"s_Hidden"];
        _s_Hidden=s_Hidden;
        self.hidden=s_Hidden;
        [self didChangeValueForKey:@"s_Hidden"];
    }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey {
    
    BOOL automatic = NO;
    if ([theKey isEqualToString:@"s_Hidden"]) {
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
