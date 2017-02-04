//
//  VCTransformTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/9/7.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCTransformTest.h"
#import "Header.h"

@interface VCTransformTest ()
{
    UIView* _transformView;
    
    UIView* _centerView;
    
    NSInteger _index;
}
@end

@implementation VCTransformTest

+(void)initialize
{
    LOG_SELECTOR;
}

+(void)load
{
    LOG_SELECTOR;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _index = 0;
    
    _transformView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [_transformView setBackgroundColor:[UIColor blueColor]];
    _transformView.transform=CGAffineTransformIdentity;
    
//    _centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
//    _centerView.center = CGPointMake((CGRectGetWidth(_transformView.frame)/2), (CGRectGetHeight(_transformView.frame)/2));
//    _centerView.layer.cornerRadius = 5;
//    [_centerView setBackgroundColor:[UIColor redColor]];
    
    [_transformView addSubview:_centerView];
    
    [self.view addSubview:_transformView];
    
    self.navigationItem.rightBarButtonItems =@[
                                               [[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStylePlain target:self action:@selector(handleResetBarButtonClick:)],
                                               [[UIBarButtonItem alloc] initWithTitle:@"Transform" style:UIBarButtonItemStylePlain target:self action:@selector(handleTransformBarButtonClick:)],
                                                [[UIBarButtonItem alloc] initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(handleTransformAddButtonClick:)],
                                                ];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleResetBarButtonClick:(id)sender
{
    CGAffineTransform tans = _transformView.transform;
    
    _transformView.transform = CGAffineTransformIdentity;
    _transformView.frame = CGRectMake(100, 100, 100, 100);
    NSLog(@"reset %@",_transformView);
    _transformView.transform = tans;
    NSLog(@"reset %@",_transformView);



    
}

-(void)handleTransformBarButtonClick:(id)sender
{
//    _transformView.transform = CGAffineTransformIdentity;
//    NSLog(@"ttt %@",_transformView);
    _index++;
    
    _transformView.transform=CGAffineTransformMakeScale(2, 1);
    
//    
//    [UIView animateWithDuration:1 animations:^{
//        
//        _transformView.transform=CGAffineTransformMakeTranslation(0, _index*50);
//        
//    } completion:^(BOOL finished) {
//        
//        CGRect finalFrame = _transformView.frame;
//        _transformView.transform = CGAffineTransformIdentity;
//        _transformView.frame = finalFrame;
//        
//        if (finished) {
//            [UIView animateWithDuration:1 animations:^{
//                _transformView.transform=CGAffineTransformMakeScale89(2, 1);
//            } completion:^(BOOL finished){
//                
//                if (finished) {
//                    CGRect finalFrame = _transformView.frame;
//                    _transformView.transform = CGAffineTransformIdentity;
//                    _transformView.frame = finalFrame;
//                }
//            }];
//        }
//    }];
    
    NSLog(@"trans %@",_transformView);
    
}

-(void)handleTransformAddButtonClick:(id)sender
{
    for (UIView* sub in [_transformView subviews]) {
        
        [sub removeFromSuperview];
        
    }
    
    UIView* sub = VIEW(UIView, 10, 10, 10, 10);
    [sub setBackgroundColor:[UIColor redColor]];
    
    
    [_transformView addSubview:sub];
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
