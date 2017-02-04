//
//  VCCoreImageTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/9/2.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCCoreImageTest.h"
#import <ImageIO/ImageIO.h>
#import "NSData+ImageContentType.h"
#import "UIImage+Helpers.h"

@interface VCCoreImageTest ()
{
    NSInteger _index;
    NSArray* _imageArray;
}
@end

@implementation VCCoreImageTest

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _index = 0;
    _imageArray = @[@"PNG.png",@"GIF.gif"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Thumbnail" style:UIBarButtonItemStylePlain target:self action:@selector(handleBarButtonClick:)];
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
-(void)handleBarButtonClick:(id)sender
{
    for (UIView* vw in [self.view subviews]) {
        [vw removeFromSuperview];
    }
    UIImage* image = [UIImage imageNamed:_imageArray[_index]];
    UIImage* thumbnail=[image getImageRect:CGRectMake(0, 0, 100, 100)];
    if (thumbnail) {
        UIImageView * imageview=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, thumbnail.size.width, thumbnail.size.height)];
        [imageview setImage:thumbnail];
        imageview.center=self.view.center;
        [self.view addSubview:imageview];
    }
    _index++;
    if (_index>=_imageArray.count) {
        _index=0;
    }
}
@end
