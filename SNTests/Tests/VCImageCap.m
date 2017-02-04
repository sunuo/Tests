//
//  VCImageCap.m
//  SNTests
//
//  Created by xukaitiankevin on 25/10/2016.
//  Copyright © 2016 徐诺. All rights reserved.
//

#import "VCImageCap.h"
#import <Masonry/Masonry.h>

@interface VCImageCap ()

@end

@implementation VCImageCap

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage* image = [UIImage imageNamed:@"bkgrd.png"];
    ;
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(20/2, 20/2, 20/2, 180/2)]];
    
//    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];

    [self.view addSubview:imageView];
    
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.height.equalTo(@(170/2));
        make.top.equalTo(@100);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
    }];
//    imageView.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 180)
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    [image resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 180)];
//    [self.view addSubview:imageView];
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
