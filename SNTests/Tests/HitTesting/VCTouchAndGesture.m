//
//  VCTouchAndGestureViewController.m
//  SNTests
//
//  Created by kevin on 16/8/1.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCTouchAndGesture.h"
#import "KVTouchView.h"
#import "Header.h"
#import "VWTansverse.h"
@interface VCTouchAndGesture ()

@end

@implementation VCTouchAndGesture

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
//    [self.view addGestureRecognizer:tap];
    //tap.cancelsTouchesInView  = NO;
//    tap.delaysTouchesBegan = YES;
    //tap.delaysTouchesEnded = NO;
//    
   // UIControl* control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
////    [control addTarget:self action:@selector(controlClick) forControlEvents:UIControlEventTouchDown];
    //[control addTarget:self action:@selector(controlClick) forControlEvents:UIControlEventTouchUpInside];
////     UITapGestureRecognizer* tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClickOne:)];
////    [control addGestureRecognizer:tap1];
    //[self.view addSubview:control];
//    
    //[control setBackgroundColor:[UIColor redColor]];
 //   UIView* touchView  =  VIEW_RECT(KVTouchView, self.view.frame);
   // [self.view addSubview:touchView];
    //[touchView setBackgroundColor:[UIColor blueColor]];
//    
//    UIView* LLL= [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
//    
//  //  [LLL addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
//     
//     [self.view addSubview:LLL];
//    
//    
//    UITapGestureRecognizer *_tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
//    _tap.numberOfTouchesRequired = 1;
//    _tap.numberOfTapsRequired = 1;
//    
//    
////    UITapGestureRecognizer *_doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
////    _doubleTap.numberOfTouchesRequired = 1;
////    _doubleTap.numberOfTapsRequired = 2;
//    
////    [_tap requireGestureRecognizerToFail:_doubleTap];
//    
//    [LLL addGestureRecognizer:_tap];
//
////
//     UIControl* control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
//    //    [control addTarget:self action:@selector(controlClick) forControlEvents:UIControlEventTouchDown];
//    [control addTarget:self action:@selector(controlClick) forControlEvents:UIControlEventTouchUpInside];
//    [control setBackgroundColor:[UIColor redColor]];
//    //     UITapGestureRecognizer* tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClickOne:)];
//    //    [control addGestureRecognizer:tap1];
//    [self.view addSubview:control];
    
    UIView* cover = VIEW_RECT(UIView, self.view.frame);
    [self.view addSubview:cover];
    [cover setBackgroundColor:[UIColor blueColor]];
    [cover addGestureRecognizer:tap];
    
//    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
//    [button setBackgroundImage:[self createImageWithColor:[UIColor redColor] frame:self.view.frame] forState:UIControlStateNormal];
//    [button setBackgroundImage:[self createImageWithColor:[UIColor greenColor] frame:self.view.frame] forState:UIControlStateHighlighted];
//    //UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2,self.view.frame.size.width, self.view.frame.size.height/2)];
//    [button setBackgroundColor:[UIColor blueColor]];
//    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
    

    
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
-(void)buttonClick
{
//    NSString
//    NSLog(@"LOG_KV:::%@___%@___%@___%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd),self,(str_ing));
    LOG_SELECTOR;
}

-(void)controlClick
{
    LOG_SELECTOR;
}

-(void)tapClickOne:(id)sender
{
   LOG_SELECTOR;
}

-(void)tapClick:(id)sender
{
    LOG_SELECTOR;
}

-(void)loadView
{
    self.view=[[KVTouchView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view setBackgroundColor:[UIColor whiteColor]];//子view不响应则父view 响应
}


- (UIImage *)createImageWithColor:(UIColor *)color frame:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
