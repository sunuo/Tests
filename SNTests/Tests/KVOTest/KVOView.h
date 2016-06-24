//
//  KVOView.h
//  SNTests
//
//  Created by xukaitiankevin on 16/6/24.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KVOFrame @"viewFrame"
#define KVOHidden @"viewHidden"

@interface KVOView : UIView
{
    CGRect viewFr;
}
@property(nonatomic,assign)BOOL viewHidden;

-(void)setViewFrame:(CGRect)frame;
-(void)setViewHidden:(BOOL)hidden;

-(CGRect)viewFrame;
@end
