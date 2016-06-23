//
//  QYStripButton.h
//  SNTests
//
//  Created by xukaitiankevin on 16/6/23.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QYStripProtocol.h"

@interface QYStripButton : UIButton <QYStripProtocol>

@property(nonatomic,assign)StripDirection s_Direction;//默认为StripDirectionHorizonFromLeft
@property(nonatomic,assign)StripEdgeInsets s_insets;//内边缘
@property(nonatomic,assign)StripEdgeInsets s_outsets;//外边缘
@property(nonatomic,assign)NSInteger s_index;//排序标记
@property(nonatomic,assign)BOOL s_Hidden;//是否隐藏 用来代替 view hidden
@property(nonatomic,assign)BOOL s_autoResize;//自动调整大小
@end