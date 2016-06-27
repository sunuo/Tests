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
    QYStripButton* _btnPush;
    QYStripButton* _btnFavor;
    
    
    QYStripViewContainer* _left2right;
    QYStripViewContainer* _bottom2top;
    QYStripViewContainer* _right2left;
    QYStripViewContainer* _top2bottom;
    
    QYStripViewContainer* _currentContiner;
    
    NSInteger _index;
    
}
@end

@implementation VCStripViewTest

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _index=0;
    // Do any additional setup after loading the view.
    
    
    _left2right=[[QYStripViewContainer alloc] initWithFrame:CGRectMake(40,
                                                                                             80,
                                                                                             CGRectGetWidth(self.view.bounds)-40*2,
                                                                                             40)];
    _left2right.s_direction=StripDirectionHorizonFromLeft;
    
    
    _bottom2top=[[QYStripViewContainer alloc] initWithFrame:CGRectMake(0,
                                                                                             CGRectGetMaxY(_left2right.frame),
                                                                                             40,
                                                                                             CGRectGetWidth(_left2right.frame))];
    _bottom2top.s_direction=StripDirectionVerticaFromlBottom;
    
    
    _right2left=[[QYStripViewContainer alloc] initWithFrame:CGRectMake(40,
                                                                                             CGRectGetMaxY(_bottom2top.frame),
                                                                                             CGRectGetWidth(_left2right.frame),
                                                                                             40)];
    _right2left.s_direction=StripDirectionHorizonFromRight;
    
    
    _top2bottom=[[QYStripViewContainer alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_left2right.frame),
                                                                                              CGRectGetMaxY(_left2right.frame),
                                                                                              40,
                                                                                              CGRectGetWidth(_left2right.frame))];
    _top2bottom.s_direction=StripDirectionVerticaFromlTop;
    
    [_left2right setViewInsets:StripInsets(5, 5, 5, 5)];
    [_right2left setViewInsets:StripInsets(5, 5, 5, 5)];
    [_top2bottom setViewInsets:StripInsets(5, 5, 5, 5)];
    [_bottom2top setViewInsets:StripInsets(5, 5, 5, 5)];
    
    [self.view addSubview:_left2right];
    [self.view addSubview:_bottom2top];
    [self.view addSubview:_right2left];
    [self.view addSubview:_top2bottom];
    
    _currentContiner=_left2right;
    
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
    
    _index++;
    
    if (_index>16) {
        _index=0;
    }
    
    switch (_index) {
        case 1:{
            [_left2right removeAll];
            [_right2left removeAll];
            [_top2bottom removeAll];
            [_bottom2top removeAll];
            
            _btnCollect=[[[[[[[QYStripButton alloc] init]
                         setViewFrame:CGRectMake(0, 0, 40, 40)]
                         setViewIndex:1]
                         setViewOutsets:HorizonInsets(5, 5)]
                         c_setImage:[UIImage imageNamed:@"collection"] forState:UIControlStateNormal]
                         c_addTarget:self action:@selector(handleButtonClick:) forControlEvents:UIControlEventTouchUpInside
                         ];
            
            [_currentContiner addStripObject:_btnCollect];
//            [_right2left addStripObject:_btnCollect];
//            [_top2bottom addStripObject:_btnCollect];
//            [_bottom2top addStripObject:_btnCollect];

        }break;
        case 2:{
            _btnFavor=[[[[[[[QYStripButton alloc] init]
                             setViewFrame:CGRectMake(0, 0, 40, 40)]
                            setViewIndex:3]
                           setViewOutsets:HorizonInsets(5, 5)]
                          c_setImage:[UIImage imageNamed:@"favorite"] forState:UIControlStateNormal]
                         c_addTarget:self action:@selector(handleButtonClick:) forControlEvents:UIControlEventTouchUpInside
                         ];
            
            [_currentContiner addStripObject:_btnFavor];
//            [_right2left addStripObject:_btnFavor];
//            [_top2bottom addStripObject:_btnFavor];
//            [_bottom2top addStripObject:_btnFavor];

        }break;
        case 3:
            _btnPush=[[[[[[[QYStripButton alloc] init]
                             setViewFrame:CGRectMake(0, 0, 40, 40)]
                            setViewIndex:2]
                           setViewOutsets:HorizonInsets(5, 5)]
                          c_setImage:[UIImage imageNamed:@"push"] forState:UIControlStateNormal]
                         c_addTarget:self action:@selector(handleButtonClick:) forControlEvents:UIControlEventTouchUpInside
                         ];
            
            [_currentContiner addStripObject:_btnPush];
//            [_right2left addStripObject:_btnPush];
//            [_top2bottom addStripObject:_btnPush];
//            [_bottom2top addStripObject:_btnPush];

            break;
        case 4:
            _btnShare=[[[[[[[QYStripButton alloc] init]
                             setViewFrame:CGRectMake(0, 0, 40, 40)]
                            setViewIndex:4]
                           setViewOutsets:HorizonInsets(5, 5)]
                          c_setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal]
                         c_addTarget:self action:@selector(handleButtonClick:) forControlEvents:UIControlEventTouchUpInside
                         ];
            
            [_currentContiner addStripObject:_btnShare];
//            [_right2left addStripObject:_btnShare];
//            [_top2bottom addStripObject:_btnShare];
//            [_bottom2top addStripObject:_btnShare];
            break;
        case 5:{
            [_btnPush setViewHide:YES];
        }break;
        case 6:
        {
            [_btnShare setViewHide:YES];
        }break;
        case 7:{
            [_btnFavor setViewHide:YES];
        }break;
        case 8:{
            [_btnCollect setViewHide:YES];
        }break;
        case 9:{
            [_btnPush setViewHide:NO];
        }break;
        case 10:
        {
            [_btnShare setViewHide:NO];
        }break;
        case 11:{
            [_btnFavor setViewHide:NO];
        }break;
        case 12:{
            [_btnCollect setViewHide:NO];
        }break;

        case 13:{
            [_btnPush setViewFrame:CGRectMake(0, 0, 80, 40)];
        }break;
        case 14:
        {
            [_btnShare setViewFrame:CGRectMake(0, 0, 20, 40)];
        }break;
        case 15:{
            [_btnFavor setViewFrame:CGRectMake(0, 0, 20, 20)];
        }break;
        case 16:{
            [_btnCollect setViewFrame:CGRectMake(0, 0, 80, 80)];
        }break;
        default:break;
    }
}

-(void)handleTapClick:(id)sender
{
    [_currentContiner removeAll];
    if (_currentContiner==_left2right) {
        _currentContiner=_bottom2top;
    }
    else if(_currentContiner==_bottom2top)
    {
        _currentContiner=_right2left;
    }
    else if(_currentContiner==_right2left)
    {
        _currentContiner=_top2bottom;
    }
    else
    {
        _currentContiner=_left2right;
    }
    _index=0;
}

-(void)handleButtonClick:(id)sender
{
    id<QYStripProtocol> view=sender;
    
    NSLog(@"button %ld clicked",(long)view.s_index);
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
