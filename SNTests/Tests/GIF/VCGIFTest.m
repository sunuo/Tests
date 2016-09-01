//
//  VCGIFTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/31.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCGIFTest.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImage+GIF.h"
#import "UIImage+animatedGIF.h"
@interface VCGIFTest ()

@end

@implementation VCGIFTest

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    UIImageView* imageview2=[[UIImageView alloc] init];
    UIImage* image = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GIF" ofType:@"gif"]]] ];
//    UIImage* image = [UIImage sd_animatedGIFNamed:@"GIF"];
    [imageview2 setImage:image];
    
    [self.view addSubview:imageview2];
    
    [imageview2 setFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width*image.size.height/image.size.width)];
    
    UIImageView* imageview=[[UIImageView alloc] init];
   
    
    [imageview sd_setImageWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GIF" ofType:@"gif"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
      
       [imageview setImage:image];
        
       [self.view addSubview:imageview];
       
       [imageview setFrame:CGRectMake(0, CGRectGetMaxY(imageview2.frame), self.view.frame.size.width, self.view.frame.size.width*image.size.height/image.size.width)];
        
       
        
//    //SvGifView* gifView  =  [[SvGifView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageview.frame), CGRectGetWidth(imageview.frame), CGRectGetHeight(imageview.frame))fileURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GIF" ofType:@"gif"]]];
//        
//       SvGifView* gifView  =  [[SvGifView alloc] initWithCenter:self.view.center fileURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GIF" ofType:@"gif"]]];
//       
//       [self.view addSubview:gifView];
//        
//        [gifView startGif];
        
    }];
    
    
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
