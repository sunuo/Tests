//
//  Thread.h
//  SNTests
//
//  Created by xukaitiankevin on 2016/11/16.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#ifndef Thread_h
#define Thread_h
#import <Foundation/Foundation.h>

@interface ThreadWrapper : NSObject
-(void)start; // 启动
-(void)stop;  // 停止
@end

#endif /* Thread_h */
