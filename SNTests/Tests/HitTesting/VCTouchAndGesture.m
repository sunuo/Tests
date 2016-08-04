//
//  VCTouchAndGestureViewController.m
//  SNTests
//
//  Created by kevin on 16/8/1.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCTouchAndGesture.h"
#import "KVTouchView.h"
@interface VCTouchAndGesture ()

@end

@implementation VCTouchAndGesture

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView * label =[[UIView alloc] initWithFrame:self.view.bounds];
    
    label.backgroundColor = [UIColor greenColor];
    
//    [label setText:@"click me"];
    
    [self.view addSubview:label];
    
    [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
    

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

-(void)tapClick:(id)sender
{
    NSLog(@"tap click");
}

-(void)loadView
{
    self.view=[[KVTouchView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view setBackgroundColor:[UIColor whiteColor]];//子view不响应则父view 响应
}


@end
