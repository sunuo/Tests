//
//  VCKVOTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/6/24.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCKVOTest.h"

static const NSString* KVOCntext;

@implementation VCKVOTest
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    
    _kview =[[KVOView alloc] initWithFrame:CGRectMake(0, 80, 100, 100)];
    [_kview setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:_kview];
    
    
    {
        NSString* ttt=@"sss";
        _kview.test=ttt;
        
    }
    
    self.navigationItem.rightBarButtonItems=@[
                                             [[UIBarButtonItem alloc] initWithTitle:@"hidden" style:UIBarButtonItemStylePlain target:self action:@selector(hideView)],
                                             
                                             [[UIBarButtonItem alloc] initWithTitle:@"frame" style:UIBarButtonItemStylePlain target:self action:@selector(resetFrame)]
                                             ];
    [_kview addObserver:self forKeyPath:KVOFrame options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:&KVOCntext];
    [_kview addObserver:self forKeyPath:KVOHidden options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:&KVOCntext];
    
    [_kview setValue:[NSValue valueWithCGRect:CGRectMake(0, 80, 300, 300)] forKey:KVOFrame];
    
    NSLog(@":::%@",_kview.test);
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (context==&KVOCntext) {
        
        NSLog(@"%@ %@ %@",object,change,keyPath);
        
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


-(void)resetFrame
{
//    [UIView animateWithDuration:0.5 animations:^{
        [_kview setViewFrame:CGRectMake(0, 80, 200, 200)];
//    }];
}



-(void)hideView
{
    [_kview setViewHidden:YES];
    
}
@end
