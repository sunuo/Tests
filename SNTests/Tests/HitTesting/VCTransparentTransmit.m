//
//  VCTransparentTransmit.m
//  SNTests
//
//  Created by xukaitiankevin on 16/7/16.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCTransparentTransmit.h"
#import "VWTransparent.h"

//过程
//1 父视图轮询子视图，找到在pointInside返回为Yes的最前面的子视图
//2 假如子视图hitest为nil，跳转3,否则跳转4
//3 父视图处理此事件
//4 继续 1

//伪代码
//- (UIView *)hitTest:(CGPoint)point
//          withEvent:(UIEvent *)event
//{
//    if (![self pointInside:point withEvent:event]) {
//        return nil;
//    }
//
//    NSArray* sortedSubViews={/*对subview按照index由大到小排序,index为视图层级，0为添加的第一个视图*/};
//
//    for (UIView* subview in [self subviews]) {
//
//        if(subview.hidden||subview.alpha < 0.01||subview.userInteractionEnabled==NO)
//            continue;
//
//        CGPoint covertPoint=[self convertPoint:point toView:subview];
//
//        UIView* hitView=[subview hitTest:covertPoint withEvent:event];
//
//        if (hitView) {
//            return hitView;
//        }
//    }
//    return self;
//}


@interface VCTransparentTransmit ()

@end

@implementation VCTransparentTransmit

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    VWTransparent* vw=VIEW_RECT(VWTransparent, CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width));
    [vw setCenter:self.view.center];
    [vw setBackgroundColor:[UIColor greenColor]];
    [vw setAlpha:0.5];
    
    KVTouchView* touchView=VIEW_RECT(KVTouchView, vw.frame);
    [touchView setCenter:self.view.center];
    touchView.name=@"--------------------center--------------------";
    
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(vw.frame)-30, 30, 30)];
    [button setBackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(buttonClickHandle) forControlEvents:UIControlEventTouchDown];
    
    KVTouchView* vwLeft=VIEW_RECT(KVTouchView, CGRectMake(0, 0, CGRectGetWidth(vw.frame)/2, CGRectGetWidth(vw.frame)/2));
    [vwLeft setBackgroundColor:[UIColor orangeColor]];[vwLeft setAlpha:0.5];
    vwLeft.name=@"left";
    
    KVTouchView* vwRight=VIEW_RECT(KVTouchView, CGRectMake(CGRectGetMaxX(vwLeft.frame), 0, CGRectGetWidth(vw.frame)/2, CGRectGetWidth(vw.frame)/2));
    [vwRight setBackgroundColor:[UIColor blueColor]];[vwRight setAlpha:0.5];
//    vwRight.hidden=YES;//虽然pointinside返回yes，但是响应时间不被透传
    vwRight.userInteractionEnabled=NO;//虽然pointinside返回yes，但是响应不被透传
    vwRight.name=@"vwRight";
    [self.view addSubview:touchView];
    [self.view addSubview:vw];
    [vw addSubview:vwLeft];
    [vw addSubview:vwRight];
    [vw addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

-(void)loadView
{
    self.view=[[KVTouchView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view setBackgroundColor:[UIColor whiteColor]];//子view不响应则父view 响应
}

-(void)buttonClickHandle
{
    LOG_SELECTOR;
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
