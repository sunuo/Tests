//
//  VCUndoRedo.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/9.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCUndoRedo.h"
#import "Header.h"

@interface VCUndoRedo()
@property(strong,nonatomic)NSUndoManager* undoManager;
@end

@implementation VCUndoRedo
{
    UILabel* _label;
    NSInteger _index;
}
@synthesize undoManager=_undoManager;
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    _index  =  0;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.navigationItem.rightBarButtonItems=@[
                                                [[UIBarButtonItem alloc] initWithTitle:@"undo" style:UIBarButtonItemStylePlain target:self action:@selector(undo)],
                                                [[UIBarButtonItem alloc] initWithTitle:@"redo" style:UIBarButtonItemStylePlain target:self action:@selector(redo)]
                                             ];
    
    
    _label =  VIEW(UILabel, 0, 0, CGRectGetWidth(self.view.frame),CGRectGetHeight(self.view.frame)/2);
    [_label setTextAlignment:NSTextAlignmentCenter];
    [_label setFont:[UIFont systemFontOfSize:50.0f]];
    
    
    UIButton* addButton = VIEW(UIButton, 0, CGRectGetMaxY(_label.frame), CGRectGetWidth(self.view.frame),CGRectGetHeight(self.view.frame)/2);
    [addButton setTitle:@"ADD" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.undoManager beginUndoGrouping];
    
    [_label setText:[NSString stringWithFormat:@"%@",@(_index)]];
    
    [self.view addSubview:_label];
    [self.view addSubview:addButton];
    

    
}


-(void)undo
{
    LOG_SELECTOR;
    
//    [self.undoManager endUndoGrouping];
    [self.undoManager undo];
}

-(void)redo
{
    LOG_SELECTOR;
    [self.undoManager redo];
    
    NSInteger ii=111;
    NSLog(@"%ld",(long)ii);
}

-(void)addButtonClick:(id)sender
{
    
     [self.undoManager registerUndoWithTarget:self selector:@selector(registUodo:) object:@(_index)];
    
    _index++;
    
    [self setCurrentIndex:@(_index)];
    
}
     
-(void)setCurrentIndex:(NSNumber*)index
{
    
    _index = [index integerValue];
    
    [_label setText:[NSString stringWithFormat:@"%@",index]];
    
}

-(void)registUodo:(NSNumber*)index
{
    [self.undoManager registerUndoWithTarget:self selector:@selector(registRedo:) object:@(_index)];
    
    [self setCurrentIndex:index];
}

-(void)registRedo:(NSNumber*)index
{
    [self.undoManager registerUndoWithTarget:self selector:@selector(registUodo:) object:@(_index)];
    
    [self setCurrentIndex:index];
}


QYGetter(NSUndoManager, undoManager);

@end
