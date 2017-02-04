//
//  MRCBlockHandler.h
//  SNTests
//
//  Created by xukaitiankevin on 16/9/27.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Handler)();

@interface MRCBlockHandler : NSObject
@property(nonatomic,copy) Handler handler;
-(void)handle;

+(id)sharedInstace;

@end
