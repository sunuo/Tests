
//
//  OBJKVC.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/24.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "OBJKVC.h"

@implementation OBJKVC
-(NSString*)description
{
    return [NSString stringWithFormat:@"%@ %@ %@",[super description],self.name,self.sex];;
}

@end
