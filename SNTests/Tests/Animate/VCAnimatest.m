//
//  VCAnimatest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/8/31.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCAnimatest.h"
#import "Header.h"
#import "UIView+Draw.h"
#import "KVDrawView.h"
@interface VCAnimatest ()
{
    UIView* _animateView;
}
@end

@implementation VCAnimatest

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    KVDrawView*view = VIEW(KVDrawView, 10, 84, 150, 150);
    [view setBackgroundColor:[UIColor clearColor]];
    [view.layer setBorderColor:[UIColor redColor].CGColor];
    [view.layer setBorderWidth:2.0f];
//    CGContextRef context =[view getCurrentContext];
    UIView* vw2=VIEW(UIView, 0, 0, 60, 60);
    [vw2 setBackgroundColor:[UIColor blueColor]];
    [vw2 setCenter:CGPointMake(CGRectGetWidth(view.frame)/2, CGRectGetHeight(view.frame)/2)];
    [view addSubview:vw2];
    [vw2.layer setBorderColor:[[UIColor orangeColor] CGColor]];
    [vw2.layer setBorderWidth:1.0f];
    
    UIView* vw3=VIEW(UIView, 0, 0, 10, 10);
    [vw3 setBackgroundColor:[UIColor redColor]];
    [vw3 setCenter:CGPointMake(CGRectGetWidth(vw2.frame)/2, CGRectGetHeight(vw2.frame)/2)];
    [vw2 addSubview:vw3];

    vw2.transform=CGAffineTransformRotate(CGAffineTransformIdentity, M_PI/4);
//    vw2.transform=CGAffineTransformRotate(CGAffineTransformIdentity, 0);//覆盖
    UIView* vw4=VIEW(UIView, 0, 0, 10, 10);
    [vw4 setBackgroundColor:[UIColor redColor]];
    [vw4 setCenter:CGPointMake(CGRectGetWidth(vw2.frame)/2, CGRectGetHeight(vw2.frame)/2)];
    [vw2 addSubview:vw4];
    
    
    UIView* vw5 = VIEW_RECT(UIView, vw2.frame);
    [vw5 setBackgroundColor:[UIColor clearColor]];
    [vw5.layer setBorderWidth:2.0f];
    [vw5.layer setBorderColor:[[UIColor greenColor] CGColor]];
    [vw2.superview addSubview:vw5];
    
    
    [self.view addSubview:view];
//    [self performSelectorOnMainThread: withObject:_animateView waitUntilDone:NO];
//    [self performSelector:@selector(loadKeyFrameAnimate:) withObject:_animateView afterDelay:3];
    
    
    UIView* keyFrameView=VIEW(UIView, 0, 0, 10, 10);
    _animateView=keyFrameView;
    [_animateView.layer setBackgroundColor:[UIColor redColor].CGColor];
    _animateView.layer.position=CGPointMake(10, 84);
    [self.view addSubview:keyFrameView];
    
    [self performSelector:@selector(loadKeyPathAnimate:) withObject:_animateView afterDelay:3];
//    [self loadKeyFrameAnimate:_animateView];
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

-(void)loadKeyFrameAnimate:(UIView*)animateView;
{

//    animateView.layer.position=CGPointMake(64, 10);
    [animateView.layer setBackgroundColor:[UIColor redColor].CGColor];
    CAKeyframeAnimation* animate = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animate.keyTimes=@[@0.0,@0.3,@0.4,@0.8,@1];
    animate.values=@[NSPoint(10,84),NSPoint(200+10, 84),NSPoint(200+10, 84+200),NSPoint(10, 84+200),NSPoint(10,84)];
    animate.duration = 10;
    animate.delegate=self;
    
    [animateView.layer addAnimation:animate forKey:@"kfrm"];
}

-(void)loadKeyPathAnimate:(UIView*)animateView
{
    [animateView.layer setBackgroundColor:[UIColor redColor].CGColor];
    CAKeyframeAnimation* animate = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animate.keyTimes=@[@0.0,@0.3,@0.4,@0.8,@1];
    animate.values=@[NSPoint(10,84),NSPoint(200+10, 84),NSPoint(200+10, 84+200),NSPoint(10, 84+200),NSPoint(10,84)];
    animate.path=CGPathCreateWithEllipseInRect(CGRectMake(10, 84, 150, 150), NULL);
    animate.duration = 10;
    animate.delegate=self;
    
    [animateView.layer addAnimation:animate forKey:@"kpath"];

}


-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
}
@end
