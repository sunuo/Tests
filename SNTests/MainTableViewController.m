//
//  MainTableViewController.m
//  SNTests
//
//  Created by kevin on 15/8/30.
//  Copyright (c) 2015年 徐诺. All rights reserved.
//

#import "MainTableViewController.h"
#import "VCCallEachOtherTest.h"
#import "VFLExtensionViewController.h"
#import "VCImageViewModeTest.h"//测试图片显示mode
#import "BlockTest.h"
#import "BlockTestMRC.h"
#import "VCLocalizeTest.h"
#import "VCFontHeightest.h"
#import "VCPIPTest.h"
#import "VCStripViewTest.h"
#import "VCKVOTest.h"
#import "VCSubViewHierarchy.h"
#import "VCHitest.h"
#import "VCTouchTest.h"
#import "VCTransparentTransmit.h"
#import "VCHitestTransverse.h"
#import "VCProtocol.h"
#import "VCHitVSGesture.h"
#import "VCResponderChainTest.h"
#import "VCTouchAndGesture.h"
#import "VCShelterTest.h"
#import "VCUndoRedo.h"
#import "VCOnePixelTest.h"
#import "VCOnePixelBoder.h"
#import "VCKVCTest.h"
#import "VCGIFTest.h"
#import "VCAnimatest.h"
#import "VCCoreImageTest.h"
#import "VCPhysicsEngine.h"
#import "VCTransformTest.h"
#import "KVButtonTest.h"
#import "VCAudioSession.h"
#import "VCInherit.h"
#import "VCTouchTransfer.h"
#import "VCImageCap.h"
#import "VCSerialQueue.h"
#import "VCSimpleTest.h"
#import "VCUserdefaultest.h"
#import "VCSynchronize.h"
#import "KVWebViewController.h"
#import "TCDynamicTable.h"
#import "VCLabelViewController.h"
#import "VCTableViewControllerOnePixel.h"
#define KEY_NAME @"name"
#define KEY_CLASS @"CLASS"
#define ADD_CONTROLLER(key,class) [self.aryContent addObject:@{KEY_NAME:(key),KEY_CLASS:(class)}];

@interface MainTableViewController ()
@property(nonatomic,retain)NSMutableArray* aryContent;
@property(nonatomic,strong)UIAttachmentBehavior* attachmentBehavior;
@end

@implementation MainTableViewController- (void)viewDidLoad {


    [super viewDidLoad];
    ADD_CONTROLLER(@"VCTableViewControllerOnePixel",[VCTableViewControllerOnePixel class]);
    ADD_CONTROLLER(@"VCLabelViewController",[VCLabelViewController class]);
    ADD_CONTROLLER(@"TCDynamicTable",[TCDynamicTable class]);
    ADD_CONTROLLER(@"KVWebViewController",[KVWebViewController class]);
    ADD_CONTROLLER(@"VCSynchronize",[VCSynchronize class]);
    ADD_CONTROLLER(@"VCUserdefaultest",[VCUserdefaultest class]);
    ADD_CONTROLLER(@"VCSimpleTest",[VCSimpleTest class]);
    ADD_CONTROLLER(@"VCSerialQueue",[VCSerialQueue class]);
    ADD_CONTROLLER(@"VCImageCap",[VCImageCap class]);
    ADD_CONTROLLER(@"VCTouchTransfer",[VCTouchTransfer class]);
    ADD_CONTROLLER(@"VCInherit",[VCInherit class]);
    ADD_CONTROLLER(@"VCAudioSession",[VCAudioSession class]);
    ADD_CONTROLLER(@"KVButtonTest",[KVButtonTest class]);
    ADD_CONTROLLER(@"TransformTest",[VCTransformTest class]);
    ADD_CONTROLLER(@"VCPhysicsEngine",[VCPhysicsEngine class]);
    ADD_CONTROLLER(@"VCAnimatest",[VCAnimatest class]);
    ADD_CONTROLLER(@"VCCoreImageTest",[VCCoreImageTest class]);
    ADD_CONTROLLER(@"VCGIFTest",[VCGIFTest class]);
    ADD_CONTROLLER(@"KVC test",[VCKVCTest class]);
    ADD_CONTROLLER(@"one pixel border",[VCOnePixelBoder class]);
    ADD_CONTROLLER(@"one pixel",[VCOnePixelTest class]);
    ADD_CONTROLLER(@"UnRedo",[VCUndoRedo class]);
    ADD_CONTROLLER(@"Protocol",[VCProtocol class]);
    ADD_CONTROLLER(@"控件遮挡测试",[VCShelterTest class]);
    ADD_CONTROLLER(@"响应链测试",[VCResponderChainTest class]);
    ADD_CONTROLLER(@"responder chain 与gesture",[VCHitVSGesture class]);
    ADD_CONTROLLER(@"点击和手势",[VCTouchAndGesture class]);
    ADD_CONTROLLER(@"视图递归",[VCHitestTransverse class]);
    ADD_CONTROLLER(@"视图透传",[VCTransparentTransmit class]);
    ADD_CONTROLLER(@"Touch Test", [VCTouchTest class]);
    ADD_CONTROLLER(@"Hit Test", [VCHitest class]);
    ADD_CONTROLLER(@"SUBVIEW层级", [VCSubViewHierarchy class]);
    ADD_CONTROLLER(@"KVO test",[VCKVOTest class]);
    ADD_CONTROLLER(@"StripVIew", [VCStripViewTest class]);
    ADD_CONTROLLER(@"OC和C方法相互调用",[VCCallEachOtherTest class]);
    ADD_CONTROLLER(@"Autolayout扩展测试",[VFLExtensionViewController class]);
    ADD_CONTROLLER(@"图片显示方式测试",[VCImageViewModeTest class]);
    ADD_CONTROLLER(@"Block实验 ARC",[BlockTest class]);
    ADD_CONTROLLER(@"Block实验 MRC",[BlockTestMRC class]);
    ADD_CONTROLLER(@"本地化测试",[VCLocalizeTest class]);
    ADD_CONTROLLER(@"语言高度测试", [VCFontHeightest class]);
    ADD_CONTROLLER(@"画中画", [VCPIPTest class]);
    

}

//-(UIAttachmentBehavior*)attachmentBehavior
//{
//    if (!_attachmentBehavior) {
//        _attachmentBehavior
//    }
//}

-(void)kaitiantest
{
    
}

-(UIDynamicAnimator*)dynamicAnimator
{
    if (!_dynamicAnimator) {
        _dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.tableView];
    }
    return _dynamicAnimator;
}

-(NSMutableArray*)aryContent
{
    if (!_aryContent) {
        _aryContent=[[NSMutableArray alloc] init];
    }
    return _aryContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.aryContent count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell" forIndexPath:indexPath];
    
    if (cell) {
//        UIAttachmentBehavior *spring = [[UIAttachmentBehavior alloc] initWithItem:cell attachedToAnchor:cell.center];
//        
//        spring.length = 0;
//        spring.damping = 0.5;
//        spring.frequency = 0.8;
//        
//        [self.dynamicAnimator addBehavior:spring];
    }
    
    cell.textLabel.text=[[self.aryContent objectAtIndex:[indexPath row]] objectForKey:KEY_NAME];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class vcClass=[[self.aryContent objectAtIndex:[indexPath row]] objectForKey:KEY_CLASS];
    UIViewController* vc=[[vcClass alloc] init];
    vc.title=[[self.aryContent objectAtIndex:[indexPath row]] objectForKey:KEY_NAME];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f",scrollView.contentOffset.y);
}


@end
