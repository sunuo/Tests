

//
//  VCSynchronize.m
//  SNTests
//
//  Created by xukaitiankevin on 2016/12/16.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCSynchronize.h"
#import "Header.h"

@interface VCSynchronize ()
@property(nonatomic,strong)NSMutableArray* mArray;
@end

@implementation VCSynchronize

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mArray];
    // Do any additional setup after loading the view.
    NSThread* thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadGO) object:nil];
    [NSThread sleepForTimeInterval:2];
    [thread start];
    
    
    NSThread* thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(threadGO0) object:nil];
    [thread1 start];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)threadGO
{
     NSLog(@"threadGO");
    @synchronized (_mArray) {
        NSLog(@"enter threadGO");
        
        sleep(2);
        @synchronized (_mArray)
        {
            [_mArray addObject:@"1"];
        }
        
        NSLog(@"fjnish");
    }
}


-(void)threadGO0
{
    NSLog(@"threadGO0___");
    @synchronized (_mArray) {
        NSLog(@"enter threadGO0___");
        [_mArray addObject:@"1"];
        
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
QYGetter(NSMutableArray, mArray);
@end
