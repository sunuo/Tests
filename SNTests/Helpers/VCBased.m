//
//  VCBased.m
//  OA_UIS
//
//  Created by kevin on 14-5-3.
//  Copyright (c) 2014年 kevin. All rights reserved.
//

#import "VCBased.h"

@interface VCBased ()

@end

@implementation VCBased

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:COLOR_RGB(250, 250, 250)];	// Do any additional setup after loading the view.
}

-(void)showConsole
{
    UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, DWidth, DHeight)];
    
    [label setText:@"结果请看控制台"];
    
    [label setTextAlignment:NSTextAlignmentCenter];
    
    label.adjustsFontSizeToFitWidth=YES;
    
    [label setFont:[UIFont systemFontOfSize:30.0f]];
    
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
