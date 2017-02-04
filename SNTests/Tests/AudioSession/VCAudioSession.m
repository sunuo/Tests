
//
//  VCAudioSession.m
//  SNTests
//
//  Created by xukaitiankevin on 16/9/19.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCAudioSession.h"
#import <AVFoundation/AVFoundation.h>
@interface VCAudioSession ()

@end

@implementation VCAudioSession

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.

    self.navigationItem.rightBarButtonItems =@[
                                               [[UIBarButtonItem alloc] initWithTitle:@"AudioDes" style:UIBarButtonItemStylePlain target:self action:@selector(handleAudioButtonClick:)],
//                                               [[UIBarButtonItem alloc] initWithTitle:@"Transform" style:UIBarButtonItemStylePlain target:self action:@selector(handleTransformBarButtonClick:)],
//                                               [[UIBarButtonItem alloc] initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(handleTransformAddButtonClick:)],
                                               ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)handleAudioButtonClick:(id)sender
{
    AVAudioSession* audioSession = [AVAudioSession sharedInstance];
    AVAudioSessionRouteDescription* currentRoute = audioSession.currentRoute;
    for (AVAudioSessionPortDescription* outputPort in currentRoute.outputs){
        if([outputPort.portType isEqualToString:AVAudioSessionPortAirPlay])
        {
            NSLog(@"airplay activity");
        }
        
        NSLog(@"%@",outputPort);
        
    }
    
    

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
