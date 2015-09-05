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
#define KEY_NAME @"name"
#define KEY_CLASS @"CLASS"

@interface MainTableViewController ()
@property(nonatomic,retain)NSMutableArray* aryContent;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.aryContent addObject:@{KEY_NAME:@"OC和C方法相互调用",KEY_CLASS:[VCCallEachOtherTest class]}];
    [self.aryContent addObject:@{KEY_NAME:@"Autolayout扩展测试",KEY_CLASS:[VFLExtensionViewController class]}];
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


@end
