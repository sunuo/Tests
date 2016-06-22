//
//  VCPIPTest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/6/17.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCPIPTest.h"

@interface VCPIPTest ()<AVPictureInPictureControllerDelegate>
{
    
}
@property(nonatomic,strong)AVPlayer* player;
@property(nonatomic,strong)AVPlayerLayer* avLayer;
@property(nonatomic,strong)AVPictureInPictureController* pipController;
@end

@implementation VCPIPTest

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.player =[AVPlayer playerWithURL:[[NSBundle mainBundle] URLForResource:@"samplemovie" withExtension:@"mov"]];
    
    self.avLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    
    [self.avLayer setFrame:self.view.layer.bounds];
    
    [self.view.layer addSublayer:self.avLayer];
    
    [self.player play]; 

    self.pipController = [[AVPictureInPictureController alloc] initWithPlayerLayer:self.avLayer];
    
    self.pipController.delegate=self;
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"PIP" style:UIBarButtonItemStylePlain target:self action:@selector(startPIP)];
    // Do any additional setup after loading the view.
}

-(void)startPIP
{
    if ([AVPictureInPictureController isPictureInPictureSupported]) {
     
        [self.pipController startPictureInPicture];
        
    }
    else{
        NSLog(@"no support pip");
    }
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

#pragma mark - pip delegate

-(void)pictureInPictureControllerDidStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController
{
    NSLog(@"%@ %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    
}

-(void)pictureInPictureControllerDidStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController
{
    NSLog(@"%@ %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

@end
