
//
//  KVButtonTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/9/12.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "KVButtonTest.h"
#import "Header.h"

@interface KVButtonTest ()

@end

@implementation KVButtonTest

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton* button  = VIEW(UIButton, (self.view.frame.size.width-200)/2, 100, 200, 200);
    [button.layer setBorderColor:[UIColor redColor].CGColor];
    button.layer.borderWidth=1;
    
    [button setTitle:@"穹妹" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"mei.jpeg"] forState:UIControlStateNormal];
    CGFloat widthImage = button.imageView.intrinsicContentSize.width;
    
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 30, -button.titleLabel.intrinsicContentSize.width);
    button.titleEdgeInsets = UIEdgeInsetsMake(200-30, -100, -button.imageView.intrinsicContentSize.height, 0);
    // button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.frame.size.height, 0, 0, -button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    


    
    [self.view addSubview:button];
    
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
