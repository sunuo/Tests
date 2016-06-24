//
//  QYStripProtocol.h
//  SNTests
//
//  Created by xukaitiankevin on 16/6/22.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//#define KVO
#define KVO_S_FRAME @"s_frame"
#define KVO_S_INSETS @"s_insets"
#define KVO_S_OUTSETS @"s_outsets"
#define KVO_S_DIRECTION @"s_Direction"
#define KVO_S_HIDDEN @"s_Hidden"
#define KVO_S_INDEX @"s_index"

//macro
#define StripEdgeInsets UIEdgeInsets
#define StripInsets(top,left,bottom,right) (UIEdgeInsetsMake(top, left, bottom, right))
#define VerticalInsets(top,bottom) (UIEdgeInsetsMake(top, 0, bottom, 0))
#define HorizonInsets(left,right) (UIEdgeInsetsMake(0, left, 0, right))
#define StripInsetsEqual(left,right) (UIEdgeInsetsEqualToEdgeInsets(left, right))

typedef enum
{
    StripDirectionHorizonFromLeft,//左到右扩展，第一个处于最左边
    StripDirectionHorizonFromRight,//右到左扩展，第一个处于最右边
    StripDirectionVerticaFromlTop,//上到下扩展，第一个处于最上边
    StripDirectionVerticaFromlBottom//下到上扩展，第一个处于最下边
}StripDirection;//水平类型或垂直类型

@protocol QYStripProtocol <NSObject>

@required
@property(nonatomic,assign)StripDirection s_Direction;//默认为StripDirectionHorizonFromLeft
@property(nonatomic,assign)StripEdgeInsets s_insets;//内边缘
@property(nonatomic,assign)StripEdgeInsets s_outsets;//外边缘
@property(nonatomic,assign)NSInteger s_index;//唯一标记 用来排序
@property(nonatomic,assign)BOOL s_Hidden;//是否隐藏 用来代替 view hidden
@property(nonatomic,assign)BOOL s_autoResize;//自动调整大小
@property(nonatomic,assign)CGRect s_frame;//更改frame

@optional
-(void)addStripObject:(UIView<QYStripProtocol>*)view;//添加控件; 必须保证是NSObject类型
-(UIView<QYStripProtocol>*)objectAtIndex:(NSInteger)index;//index 指的是 s_index
-(void)removeStripObject:(UIView<QYStripProtocol>*)view;//删除控件; 必须保证是NSObject类型
-(void)removeStripObjectAtIndex:(NSInteger)index;//删除控件 index 指的是 s_index
-(void)hideStripObjectAtIndex:(NSInteger)index;//隐藏控件 index 指的是 s_index
-(void)hideStripObject:(UIView<QYStripProtocol>*)view;
-(void)recalculateViewsIfNeeded;//立刻重新排列控件
-(void)removeSelf;//删除操作
-(void)adjustToContentSize;//自动调整容器大小
@end
