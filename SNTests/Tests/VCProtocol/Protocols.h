
//
//  ProtocolA.h
//  SNTests
//
//  Created by xukaitiankevin on 16/7/20.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProtocolA <NSObject>
@optional
-(void)printA;
@end


@protocol ProtocolB <NSObject>
@optional
-(void)printB;
@end

@protocol Protocol_AB <ProtocolA,ProtocolB>
@optional
-(void)printAB;
@end
