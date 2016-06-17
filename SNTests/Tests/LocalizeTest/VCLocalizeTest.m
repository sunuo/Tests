//
//  VCLocalizeTest.m
//  SNTests
//  支持简体和繁体两种文字，假如系统语言设置为其他语言如 法语，会有什么情况
//
//  Created by xukaitiankevin on 16/6/7.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCLocalizeTest.h"

@interface VCLocalizeTest ()

@end

@implementation VCLocalizeTest

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel* testLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    [testLabel setText:NSLocalizedString(@"kTest",nil)];
    [testLabel setFont:[UIFont systemFontOfSize:60.0f]];
    [testLabel setTextAlignment:NSTextAlignmentCenter];
    
    [self.view addSubview:testLabel];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

//实际测试发现 当系统语言为没有本地化时，会选用最后一次使用的本地化的语言
//若是未初始化的新手机 。。。就不知道了。。。

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
