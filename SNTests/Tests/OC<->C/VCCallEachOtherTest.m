

//
//  VCCallEachOtherTest.m
//  KVTestAll
//
//  Created by kevin on 15/8/30.
//
//

#import "VCCallEachOtherTest.h"
#import "ObjCall.h"
@interface VCCallEachOtherTest ()

@end

@implementation VCCallEachOtherTest

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showConsole];
    // Do any additional setup after loading the view.
    ObjCall* call=[[ObjCall alloc] init];
    
    [call call];
    
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

@end
