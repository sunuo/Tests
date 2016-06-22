//
//  QYStripProtocol.h
//  SNTests
//
//  Created by xukaitiankevin on 16/6/22.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define StripEdgeInsets UIEdgeInsets
#define StripInsets(top,left,bottom,right) UIEdgeInsetsMake(top, left, bottom, right)

typedef enum {StripDirectionHorizon,StripDirectionVertical}StripDirection;//水平类型或垂直类型

@protocol QYStripProtocol <NSObject>

@property(nonatomic,assign)StripDirection stripDirection;//默认为水平
@property(nonatomic,assign)StripEdgeInsets insets;//边缘
@property(nonatomic,assign)NSInteger index;//边缘

-(void)addStripView:(UIView*)view;//添加控件;
-(void)removeStripView:(UIView*)view;//删除控件;
-(void)removeStripViewAtIndex:(NSInteger)index;//删除控件
-(void)hideStripViewAtIndex:(NSInteger)index;//隐藏控件
-(void)resizeViewsIfNeeded;//立刻重新排列控件
@end
