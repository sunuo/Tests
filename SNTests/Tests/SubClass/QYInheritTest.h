//
//  QYInheritTest.h
//  SNTests
//
//  Created by xukaitiankevin on 16/9/8.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface father : NSObject
-(void)hello;
@end

@interface son : father
-(void)superCall;
@end


@interface QYInheritTest : NSObject
+(void)sayHello;
@end
