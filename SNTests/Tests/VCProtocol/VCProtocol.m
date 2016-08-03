
//
//  VCProtocol.m
//  SNTests
//
//  Created by xukaitiankevin on 16/7/20.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCProtocol.h"
#import "ProtocolObj.h"
@implementation VCProtocol
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    ProtocolObj* obj=[[ProtocolObj alloc] init];
    
    [obj printA];
}

@end
