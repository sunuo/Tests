//
//  QYStripViewContainer.h
//  SNTests
//
//  Created by xukaitiankevin on 16/6/22.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYStripProtocol.h"
@interface QYStripViewContainer : UIView<QYStripProtocol>
{
    @protected
    NSMutableArray* _viewArray;
}
@property(nonatomic,assign)StripDirection s_Direction;//默认为StripDirectionHorizonFromLeft
@property(nonatomic,assign)StripEdgeInsets s_insets;//内边缘
@property(nonatomic,assign)StripEdgeInsets s_outsets;//外边缘
@property(nonatomic,assign)NSInteger s_index;//排序标记
@property(nonatomic,assign)BOOL s_Hidden;//是否隐藏 用来代替 view hidden
@property(nonatomic,assign)BOOL s_autoResize;//自动调整大小

-(void)addStripObject:(UIView<QYStripProtocol>*)view;//添加控件; 必须保证是NSObject类型
-(UIView<QYStripProtocol>*)objectAtIndex:(NSInteger)index;
-(void)removeStripObject:(UIView<QYStripProtocol>*)view;//删除控件; 必须保证是NSObject类型
-(void)removeStripObjectAtIndex:(NSInteger)index;//删除控件
-(void)hideStripObjectAtIndex:(NSInteger)index;//隐藏控件
-(void)hideStripObject:(UIView<QYStripProtocol>*)view;
-(void)recalculateViewsIfNeeded;//立刻重新排列控件
-(void)removeSelf;//删除操作
-(void)adjustToContentSize;//自动调整容器大小
@end
