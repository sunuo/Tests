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
    NSMutableArray* _viewArray;
}
@end
