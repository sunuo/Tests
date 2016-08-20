//
//  VCOnePixelBoder.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/20.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCOnePixelBoder.h"
#import "Header.h"
#import "VWBorder.h"
#import "UIView+OnePixelBorder.h"
@interface VCOnePixelBoder ()

@end

@implementation VCOnePixelBoder

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor blackColor]];
    

    CGFloat pixelScale = [UIScreen mainScreen].scale;
    
    UIView* vw1 = [[UIView alloc] initWithFrame:CGRectMake(20.500000, 200.500000, 80.000000, 40.00000)];
    [vw1.layer setBorderColor:[UIColor greenColor].CGColor];
    [vw1.layer setBorderWidth:(1.0f/pixelScale)];
    
    UIView* vw2 = [[UIView alloc] initWithFrame:CGRectMake(20.500000, 300.500000, 80.000000, 40.00000)];
    [vw2.layer setBorderColor:[UIColor greenColor].CGColor];
    [vw2.layer setBorderWidth:(1.0f/pixelScale)];
    [vw2 resizeForBorder];
    
    [self.view addSubview:vw1];
    [self.view addSubview:vw2];
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
