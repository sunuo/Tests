//
//  VCPhysicsEngine.m
//  SNTests
//
//  Created by xukaitiankevin on 16/9/5.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCPhysicsEngine.h"
#import "Header.h"

@interface VCPhysicsEngine ()
@property(nonatomic,strong)UIView* physicsEnginContentView;
@end

@implementation VCPhysicsEngine

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.physicsEnginContentView];
    
    
    
    
    // Do any additional setup after loading the view.
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

-(void)viewDidAppear:(BOOL)animated
{
    
    UIView* vw = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-25, 64, 50, 50)];
    [vw.layer setCornerRadius:50/2];
    [vw setBackgroundColor:[UIColor redColor]];
    [self.physicsEnginContentView addSubview:vw];
    
    UIGravityBehavior* gravity = [[UIGravityBehavior alloc] initWithItems:@[vw]];
    [self.dynamicAnimator addBehavior:gravity];
    
    
    
    UICollisionBehavior* collision = [[UICollisionBehavior alloc] initWithItems:@[vw]];
    collision.translatesReferenceBoundsIntoBoundary=YES;
    [collision addBoundaryWithIdentifier:@"ddd" forPath:[UIBezierPath bezierPathWithOvalInRect:self.physicsEnginContentView.bounds]];
    
    [collision addChildBehavior:gravity];
    
    [self.dynamicAnimator addBehavior:collision];
    
    [self performSelector:@selector(addItem) withObject:self afterDelay:3];

}

-(void)addItem
{
    UIView* vw0 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-25, 64, 50, 50)];
    [vw0.layer setCornerRadius:50/2];
    [vw0 setBackgroundColor:[UIColor blueColor]];
    [self.physicsEnginContentView addSubview:vw0];
    
    for (UIDynamicBehavior* behavior in [self.dynamicAnimator behaviors]) {
        
        if ([behavior isKindOfClass:[UIGravityBehavior class]]) {
            [(UIGravityBehavior*)behavior addItem:vw0];
        }
        else if ([behavior isKindOfClass:[UICollisionBehavior class]]) {
            [(UICollisionBehavior*)behavior addItem:vw0];
        }
        
    }
}


-(UIDynamicAnimator*)dynamicAnimator
{
    if (!_dynamicAnimator) {
        _dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.physicsEnginContentView];
    }
    return _dynamicAnimator;
}

QYGetterWithBlock(UIView, physicsEnginContentView, ^{
    [_physicsEnginContentView setFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-100)];
    [_physicsEnginContentView setBackgroundColor:[UIColor lightTextColor]];
});

@end

