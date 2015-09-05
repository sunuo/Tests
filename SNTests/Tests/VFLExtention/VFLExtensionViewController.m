//
//  VFLExtensionViewController.m
//  SNTests
//
//  Created by kevin on 15/9/3.
//  Copyright (c) 2015年 徐诺. All rights reserved.
//

#import "VFLExtensionViewController.h"
#import "AutoLayoutTestViewController.h"
#import "LayoutConstriantExtentsion.h"
@interface VFLExtensionViewController ()
@end

@implementation VFLExtensionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UILabel* label = [self showLabel:@"这个实验是为了探索代码中使用Autolayout更简洁的方法\n"
                    @"自己扩展了VFL的语法，支持fixed aspect ratio\n"
                    @"现在业界有更成熟优美的解决方案Masonry，有兴趣的朋友们可以尝试一下，完全是两种不同的思路"
    ];
    
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setFont:[UIFont systemFontOfSize:15.0f]];
    
    self.navigationItem.rightBarButtonItems=@[
                                             
//                                             [[UIBarButtonItem alloc] initWithTitle:@"Masonry" style:UIBarButtonItemStylePlain target:self action:@selector(itemMasonryClick)],
    
                                             [[UIBarButtonItem alloc] initWithTitle:@"Extension" style:UIBarButtonItemStylePlain target:self action:@selector(itemLayoutExtensionClick)]
    
    ];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark--actions
//-(void)itemMasonryClick
//{
//    
//}

-(void)itemLayoutExtensionClick
{
    AutoLayoutTestViewController* viewController=[[AutoLayoutTestViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
