

//
//  AutoLayoutTestViewController.m
//  SNTests
//
//  Created by kevin on 15/9/4.
//  Copyright (c) 2015年 徐诺. All rights reserved.
//

#import "AutoLayoutTestViewController.h"
#import "LayoutConstriantExtentsion.h"
@interface AutoLayoutTestViewController()
@property (weak, nonatomic) IBOutlet UIView *rightView1;
@property (weak, nonatomic) IBOutlet UIView *rightView2;
@property (weak, nonatomic) IBOutlet UIView *rightView3;
@property (weak, nonatomic) IBOutlet UIView *leftView1;
@property (weak, nonatomic) IBOutlet UIView *leftView2;
@property (weak, nonatomic) IBOutlet UIView *leftView3;
@end


@implementation AutoLayoutTestViewController

#pragma mark--life cycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self installConstraintsByExtension];
    
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark--layout views
-(void)installConstraintsByOriginal
{
    
}
-(void)installConstraintsByExtension
{
    NSDictionary* viewsDictionary=NSDictionaryOfVariableBindings(_rightView1,_rightView2,_rightView3,_leftView1,_leftView2,_leftView3);
    NSArray* constraintStrings=@[
                                     @"V:|-74-[_rightView1]-10-[_rightView2]-10-[_rightView3]-10-|",
                                     
                                     @"H:|-10-[_rightView1]-10-[_leftView1]-10-|",
                                     @"H:[_rightView1(100@1000)]",
                                     @"V:[_rightView1(200@1000)]",
                                     
                                     @"_leftView1.Top=_rightView1.Top",
                                     @"V:[_leftView1][_leftView2]",
                                     @"_leftView1.Left=_leftView2.Left",
                                     @"_leftView1.Height=_rightView1.Height*0.5-10",
                                     @"_leftView2.Height=_leftView1.Height+20.0f",
                                     @"[_leftView1(==_leftView2)]",
                                     
                                     @"H:|-10-[_rightView2]-10-[_leftView3]-10-|",
                                     @"H:[_rightView2(==_leftView3)]",
                                     @"V:[_rightView2(==_leftView3)]",
                                     @"V:[_rightView2(200@1000)]",
                                     @"_leftView3.Top=_rightView2.Top",
                                     
                                     @"H:|-10-[_rightView3]-10-|",
                                 ];
    
    [NSLayoutConstraint activateConstraints:VFL(constraintStrings, viewsDictionary)];
}

-(void)installConstriantsByMasonry
{
    
}
@end
