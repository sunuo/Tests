//
//  Header.h
//  SNTests
//
//  Created by kevin on 15/8/30.
//  Copyright (c) 2015年 徐诺. All rights reserved.
//

#ifndef SNTests_Header_h
#define SNTests_Header_h


#define kMainScreenScale [UIScreen mainScreen].scale
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)


#define NSPoint(x,y) ([NSValue valueWithCGPoint:CGPointMake(x, y)])

#define COLOR_RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]
#define COLOR_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define DWidth     ([UIScreen mainScreen].bounds.size.width)
#define DHeight    ([UIScreen mainScreen].bounds.size.height)
#define float(ff) [NSNumber numberWithFloat:ff]
#define integer(integ) [NSNumber numberWithInteger:integ]

#define LOG_SELECTOR NSLog(@"LOG:::%@___%@___%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd),self)

#define VIEW(type,x,y,width,height) [[type alloc] initWithFrame:CGRectMake(x,y ,width , height)]
#define VIEW_RECT(type,rect) [[type alloc] initWithFrame:(rect)]


//对象getter方法
#define QYGetter(type,name) -(type*)name{\
if(!_##name){\
_##name=[[type alloc] init];\
}\
return _##name;\
}

//对象getter方法
#define QYGetterWithBlock(type,name,block) -(type*)name{\
if(!_##name){\
_##name=[[type alloc] init];\
block();\
}\
return _##name;\
}

#endif
