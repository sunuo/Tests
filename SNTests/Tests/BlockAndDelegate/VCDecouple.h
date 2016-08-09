//
//  VCDecouple.h
//  SNTests
//
//  Created by xukaitiankevin on 16/8/8.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <UIKit/UIKit.h>


#define DeLegate(SEL) {\
    if ([self.delegate respondsToSelector:@selector(decouple:test:message:)]) {\
        [self.delegate decouple:self test:data message:message];\
    }\
}

@protocol  VCDecoupleDeleagte <NSObject>

-(void)decouple:(id)sender test:(id)data message:(id)message;

@end

@interface VCDecouple : UIViewController<VCDecoupleDeleagte>
@property(nonatomic,assign)id<VCDecoupleDeleagte> delegate;
@end
