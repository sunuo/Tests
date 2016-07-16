//
//  Header.h
//  SNTests
//
//  Created by kevin on 15/8/30.
//  Copyright (c) 2015年 徐诺. All rights reserved.
//

#ifndef SNTests_Header_h
#define SNTests_Header_h

#define COLOR_RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]
#define COLOR_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define DWidth     ([UIScreen mainScreen].bounds.size.width)
#define DHeight    ([UIScreen mainScreen].bounds.size.height)
#define float(ff) [NSNumber numberWithFloat:ff]
#define integer(integ) [NSNumber numberWithInteger:integ]

#define LOG_SELECTOR NSLog(@"LOG:::%@___%@___%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd),self)

#define VIEW(type,x,y,width,height) [[type alloc] initWithFrame:CGRectMake(x,y ,width , height)]
#define VIEW_RECT(type,rect) [[type alloc] initWithFrame:(rect)]

#endif
