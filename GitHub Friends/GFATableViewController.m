//
//  GFATableViewController.m
//  GitHub Friends
//
//  Created by Steve Sneller on 7/24/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "GFATableViewController.h"
#import "GFATableViewCell.h"

@interface GFATableViewController ()

@end

@implementation GFATableViewController
{
    NSMutableArray * githubFriends;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        githubFriends = [@[
                           @{
                               @"login": @"ssneller",
                               @"name": @"Steve",
                               @"avatar_url": @"https://avatars0.githubusercontent.com/u/8129918?s=460",
                               @"blog": @"SS.co",
                               @"location": @"Atl",
                               @"email": @"ss@.ss.com",
                               }
                           ] mutableCopy]; ///  mutableCopy neccessary for mutable array
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    
    self.tableView.tableHeaderView = headerView;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
 #warning Potentially incomplete method implementation.
 // Return the number of sections.
 return 0;
 }
 */

/// Control cell height
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return githubFriends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GFATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];   /// needed for reusing cell for speed
    
    if (cell == nil)
    {
        cell = [[GFATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }    /// will use most of the time
    
    ///   NSDictionary * friendInfo = githubFriends[indexPath.row];
    
    cell.friendInfo = githubFriends[indexPath.row];
    
    // Configure the cell...
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
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
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
