//
//  QYStripButton.h
//  SNTests
//
//  Created by xukaitiankevin on 16/6/23.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QYStripProtocol.h"

#import "QYStripView+chain.h"

@interface QYStripButton : UIButton <QYStripProtocol>

@property(nonatomic,assign)StripDirection s_direction;//默认为StripDirectionHorizonFromLeft
@property(nonatomic,assign)StripEdgeInsets s_insets;//内边缘
@property(nonatomic,assign)StripEdgeInsets s_outsets;//外边缘
@property(nonatomic,assign)NSInteger s_index;//排序标记
@property(nonatomic,assign)BOOL s_hidden;//是否隐藏 用来代替 view hidden
@property(nonatomic,assign)BOOL s_autoResize;//自动调整大小
@property(nonatomic,assign)CGRect s_frame;

-(id)setViewIndex:(NSInteger)index;
-(id)setViewOutsets:(StripEdgeInsets)outsets;
-(id)setViewInsets:(StripEdgeInsets)insets;
-(id)setViewDirection:(StripDirection)direction;
-(id)setViewAutoResize:(BOOL)resize;
-(id)setViewHide:(BOOL)hide;
-(id)setViewFrame:(CGRect)frame;
@end