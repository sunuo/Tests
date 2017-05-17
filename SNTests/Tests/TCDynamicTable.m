//
//  TCDynamicTable.m
//  SNTests
//
//  Created by xukaitiankevin on 2017/4/25.
//  Copyright © 2017年 徐诺. All rights reserved.
//

#import "TCDynamicTable.h"
#import "Header.h"
@interface TCDynamicTable ()
{
    NSInteger _addNum;
}

@property(nonatomic,strong)NSMutableArray* dataArray;

@end

@implementation TCDynamicTable

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _addNum = 0;
    
    self.dataArray = [NSMutableArray arrayWithArray:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6"]];
    
    self.navigationItem.rightBarButtonItems = @[
                                               [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRow)],
                                               [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(resetRow)]
                                               
                                           ] ;
    
    LOG_SELECTOR;
    
    
}

-(void)addRow
{
    [self.tableView beginUpdates];
    

    [self.dataArray insertObject:@"7" atIndex:0];
    
    if (_dataArray.count==1) {
        [self.tableView reloadData];
    }
    else
    {
        LOG_SELECTOR_STR(([NSString stringWithFormat:@"__%@",_dataArray]));
        
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
        
        [self.tableView endUpdates];
    }
    
}

-(void)resetRow
{//-!
    [self.tableView beginUpdates];
    
    if (self.dataArray.count<=0) {
        return;
    }
    LOG_SELECTOR_STR(([NSString stringWithFormat:@"__%@",_dataArray]));
    [self.dataArray removeLastObject];
    LOG_SELECTOR_STR(([NSString stringWithFormat:@"__%@",_dataArray]));
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.dataArray.count inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    
    [self.tableView endUpdates];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    LOG_SELECTOR;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    LOG_SELECTOR_STR(([NSString stringWithFormat:@"___%lu",(unsigned long)self.dataArray.count]));
    return _addNum+self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LOG_SELECTOR_STR(([NSString stringWithFormat:@"___%lu__%@",(unsigned long)indexPath.row,_dataArray]));
    static NSString* reuse = @"reuseIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_dataArray[[indexPath row]]];
    
    return cell;
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
