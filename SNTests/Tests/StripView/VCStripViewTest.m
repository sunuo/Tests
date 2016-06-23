//
//  VCStripViewTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/6/22.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCStripViewTest.h"

@interface VCStripViewTest ()
{
    UIButton* _controlButton;
    
    QYStripButton* _btnCollect;
    QYStripButton* _btnShare;
    QYStripButton* _btnDownload;
    QYStripButton* _btnDanmu;
    
}
@end

@implementation VCStripViewTest

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    
    QYStripViewContainer* _left2right=[[QYStripViewContainer alloc] initWithFrame:CGRectMake(40,
                                                                                             80,
                                                                                             CGRectGetWidth(self.view.bounds)-40*2,
                                                                                             40)];
    _left2right.s_Direction=StripDirectionHorizonFromLeft;
    
    
    QYStripViewContainer* _bottom2top=[[QYStripViewContainer alloc] initWithFrame:CGRectMake(0,
                                                                                             CGRectGetMaxY(_left2right.frame),
                                                                                             40,
                                                                                             CGRectGetWidth(_left2right.frame))];
    _bottom2top.s_Direction=StripDirectionVerticaFromlBottom;
    
    
    QYStripViewContainer* _right2left=[[QYStripViewContainer alloc] initWithFrame:CGRectMake(40,
                                                                                             CGRectGetMaxY(_bottom2top.frame),
                                                                                             CGRectGetWidth(_left2right.frame),
                                                                                             40)];
    _right2left.s_Direction=StripDirectionHorizonFromRight;
    
    
    QYStripViewContainer* _top2bottom=[[QYStripViewContainer alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_left2right.frame),
                                                                                              CGRectGetMaxY(_left2right.frame),
                                                                                              40,
                                                                                              CGRectGetWidth(_left2right.frame))];
    _top2bottom.s_Direction=StripDirectionVerticaFromlTop;
    
    
    [self.view addSubview:_left2right];
    [self.view addSubview:_bottom2top];
    [self.view addSubview:_right2left];
    [self.view addSubview:_top2bottom];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"√" style:UIBarButtonItemStylePlain target:self action:@selector(handleItemClick)];
    
    _controlButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _controlButton.layer.cornerRadius=50;
    [_controlButton setBackgroundColor:[UIColor lightGrayColor]];
    _controlButton.center=CGPointMake(_left2right.center.x, _bottom2top.center.y);
    
    [_controlButton addTarget:self action:@selector(handleTapClick:) forControlEvents:UIControlEventTouchUpInside];
//    [_controlButton addTarget:self action:@selector(handleDoubleClick:) forControlEvents:UIControlEventTouchDownRepeat];
    
    [self.view addSubview:_controlButton];

}

-(void)handleItemClick
{
//    static i = 0;
//    
//    i++;
//    
//    if (i>16) {
//        i=0;
//    }
//
}

-(void)handleTapClick:(id)sender
{
    
}

//-(void)handleDoubleClick:(id)sender
//{
//    
//}

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
