

//
//  VCLabelViewController.m
//  SNTests
//
//  Created by xukaitiankevin on 2017/6/30.
//  Copyright © 2017年 徐诺. All rights reserved.
//

#import "VCLabelViewController.h"
#import "Header.h"

@interface VCLabelViewController ()
@property(nonatomic,strong)UILabel* label;
@property(nonatomic,strong)UIButton* button;
//@property(nonatomic,strong)UIView* button;
@end

@implementation VCLabelViewController

- (void)viewDidLoad {
     [super viewDidLoad];
     [self.view setBackgroundColor:[UIColor whiteColor]];
//    self.label = [[UILabel alloc] init];
//    [self.label setFont:[UIFont systemFontOfSize:20.0f]];
//    [self.label setBackgroundColor:[UIColor redColor]];
//    [self.label setText:@"哈哈"];
//    [self.label setLineBreakMode:NSLineBreakByCharWrapping];
//    [self.label setBackgroundColor:[UIColor redColor]];
//    [self.label setFrame:CGRectMake(0, 100, 5.5*18, 20)];
//    
//    
//    
//    [self.view addSubview:self.label];
//    
//    
//    
//    
//    self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 100, 50)];
//    [self.button setBackgroundColor:[UIColor greenColor]];
//    self.button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    self.button.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
//    [self.button setTitle:@"哈哈" forState:UIControlStateNormal];
//    [self.button.titleLabel setFont:[UIFont systemFontOfSize:20]];
//    [self.button.titleLabel setBackgroundColor:[UIColor redColor]];
//    [self.button.titleLabel setTextAlignment:NSTextAlignmentLeft];
//    [self.button.titleLabel sizeToFit];
//    [self.button.titleLabel setFrame:CGRectMake(0, 0, 40, 20)];
//    [self.button setTitleEdgeInsets:UIEdgeInsetsMake(10, 10, 0, 0)];
//    
//    
//    [self.view addSubview:self.button];
    
    NSInteger dd =  [@"10.88" integerValue];
    
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 150.5, 100, 50)]; [label1 setBackgroundColor:UIColorFromRGBA(0x15c011, 0.8)];
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 350, 100, 50)]; [label2 setBackgroundColor:RGBACOLOR(0x15, 0xc0, 0x11, 0.8)];
    label1.layer.borderWidth=1;
    label1.layer.borderColor=[UIColor redColor].CGColor;
    label1.layer.cornerRadius = 25;
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    
    
    // Do any additional setup after loading the view.
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
