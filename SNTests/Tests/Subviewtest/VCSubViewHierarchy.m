//
//  VCSubViewHierarchy.m
//  SNTests
//
//  Created by xukaitiankevin on 16/7/8.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCSubViewHierarchy.h"
#import "Header.h"

@interface VCSubViewHierarchy ()

@end

@implementation VCSubViewHierarchy

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    UIView* view1=VIEW(UIView, 0, 64, 50, 50);
    [view1 setBackgroundColor:[UIColor redColor]];
//    view1.hidden=YES;
//    view1.alpha=0.1;
    
    UIView* view2=VIEW_RECT(UIView, view1.frame);
    [view2 setBackgroundColor:[UIColor blueColor]];
    
    [self.view addSubview:view1];
    [view1 removeFromSuperview];
    
    [self.view insertSubview:view2 belowSubview:view1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
