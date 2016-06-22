//
//  QYStripViewContainer.m
//  SNTests
//
//  Created by xukaitiankevin on 16/6/22.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "QYStripViewContainer.h"

@implementation QYStripViewContainer

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)init
{
    if (self=[super init]) {
        
        self.stripDirection=StripDirectionHorizon;
        
        _viewArray=[[NSMutableArray alloc] init];
    }
    return self;
}

-(id)initWithDirection:(StripDirection)direction index:(NSInteger)index inset:(StripEdgeInsets)inset
{
    if (self=[super init]) {
        
        _viewArray=[[NSMutableArray alloc] init];
        
        self.stripDirection=direction;
        
        self.index=index;
        
        self.insets=inset;
    }
    return self;

}

-(void)addStripView:(UIView *)view
{
    
}

-(void)removeStripView:(UIView *)view
{
    
}

-(void)removeStripViewAtIndex:(NSInteger)index
{
    
}


@end
