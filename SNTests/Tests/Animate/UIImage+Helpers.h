//
//  UIImage+Helpers.h
//  SNTests
//
//  Created by xukaitiankevin on 16/9/2.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Helpers)
-(NSData*)image2Data;
-(UIImage*)getThumbnailAtIndex:(NSInteger)index;
-(UIImage*)getThumbnail;
-(UIImage*)getImageRect:(CGRect)rect;
@end
