//
//  VCTableViewControllerOnePixel.m
//  SNTests
//
//  Created by xukaitiankevin on 2017/7/5.
//  Copyright © 2017年 徐诺. All rights reserved.
//

#import "VCTableViewControllerOnePixel.h"

@interface VCTableViewControllerOnePixel ()

@end

@implementation VCTableViewControllerOnePixel

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    [self performSelector:@selector(request) withObject:nil afterDelay:(1+arc4random()%5)];
}

//-(void)request
//{
//    [self performSelector:@selector(request) withObject:nil afterDelay:(1+arc4random()%5)];
//    NSLog(@"request");
//    
//    NSURLRequest* request = [NSMutableURLRequest requestWithURL:@"http://gaoxueya.gorgonor.com"];
//    []
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

-(void)fuck:(UIButton*)sender
{
    NSLog(@"%@ \n %@ \n %@ \n %@ \n",sender,sender.superview,sender.superview.superview,sender.superview.superview.superview);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController* vcc = [[UIViewController alloc] init];
    vcc.view.backgroundColor = [UIColor redColor];
    
    UIButton* buttong = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    buttong.backgroundColor = [UIColor blueColor];
    [buttong addTarget:self action:@selector(fuck:) forControlEvents:UIControlEventTouchDown];
    [vcc.view addSubview:buttong];
    
    [self presentViewController:vcc animated:YES completion:^{
       
        NSLog(@"%@ %@",vcc,[vcc.view superview]);
        
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"normal"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"normal"];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        label.tag = 111;
        [cell.contentView addSubview:label];
        
    }
    
    UILabel* label = (UILabel*)[cell viewWithTag:111];
    label.text = [NSString stringWithFormat:@"dd%ld",(long)[indexPath row]];
    label.layer.borderWidth = 1;
    label.layer.borderColor = [UIColor redColor].CGColor;
    label.layer.cornerRadius = 25;
    [label setFrame:CGRectMake(20, 25, 100, 50)];

    
//    cell.textLabel.text = [NSString stringWithFormat:@"dd%ld",(long)[indexPath row]];
//    cell.textLabel.layer.borderWidth = 1;
//    cell.textLabel.layer.borderColor = [UIColor redColor].CGColor;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
