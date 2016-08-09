//
//  VCUndoRedo.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/9.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCUndoRedo.h"
#import "Header.h"

@implementation VCUndoRedo
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItems=@[
                                                [[UIBarButtonItem alloc] initWithTitle:@"undo" style:UIBarButtonItemStylePlain target:self action:@selector(undo)],
                                                [[UIBarButtonItem alloc] initWithTitle:@"redo" style:UIBarButtonItemStylePlain target:self action:@selector(redo)]
                                             ];
}


-(void)setTitle:(NSString *)title
{
    [super setTitle:title];
}

-(void)undo
{
    LOG_SELECTOR;
}

-(void)redo
{
    LOG_SELECTOR;
}
@end
