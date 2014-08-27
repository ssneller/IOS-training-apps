//
//  GFATableViewController.m
//  Github Friend
//
//  Created by Steve Sneller on 7/24/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "GFATableViewController.h"
#import "GFATableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "GFAViewController.h"
#import "GRAGitHubRequest.h"
/////   49c49db2d6ab1cb078190a672ce00e1d36013327 github token

@interface GFATableViewController ()  <UITextFieldDelegate>

{
    /// make global variables
    NSMutableArray * gitHubFriends;
    UITextField * searchTextbox;
    UIButton * searchButton;
}
///end
@end

@implementation GFATableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        /// our dictionary
        gitHubFriends = [@[
                           //// this is where the dictionary goes
                           ]mutableCopy];
        NSArray * loadedUsers = [GRAGitHubRequest loadUsers];
        
        if (loadedUsers) {
            gitHubFriends = [loadedUsers mutableCopy];
        }
        
        self.tableView.rowHeight = 100;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return self;
}

-(void)dismissKeyboard
{
    [searchTextbox resignFirstResponder];
}

- (void)viewDidLoad
{
    
 UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
 
 [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];
 

    // init header block
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];///spaces the cells down
    self.tableView.tableHeaderView = headerView;
    self.tableView.backgroundColor = [UIColor redColor];
    //top line on cell top
    CGRect sepFrame = CGRectMake(0, headerView.frame.size.height-1, 320, 1);
    UIView * seperatorView = [[UIView alloc] initWithFrame:sepFrame];
    seperatorView.backgroundColor = [UIColor blackColor];
    
    [headerView addSubview:seperatorView];
    
    //init and Setting the search box
    searchTextbox = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, 250, 40)];
    searchTextbox.backgroundColor = [UIColor whiteColor];
    searchTextbox.layer.cornerRadius = 10;
    searchTextbox.layer.masksToBounds = NO;
    searchTextbox.clipsToBounds = YES;
    searchTextbox.delegate = self;
    [searchTextbox setBorderStyle:UITextBorderStyleLine];
//    [searchTextbox addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventAllEvents];
    [headerView addSubview:searchTextbox];
    
    //adding search button
    searchButton = [[UIButton alloc]initWithFrame:CGRectMake(270, 10, 40, 40)];
    searchButton.backgroundColor = [UIColor colorWithRed:0.667f green:0.655f blue:0.639f alpha:1.0f];
    searchButton.layer.cornerRadius = 40.0/2.0;
    UIImage *buttonImage = [UIImage imageNamed:@"searchButton.png"];
    [searchButton setImage:buttonImage forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:searchButton];
    
    [self.tableView setSeparatorColor:[UIColor whiteColor]];
    
    [super viewDidLoad];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return gitHubFriends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GFATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
    
    // Configure the cell...
    if (cell == nil){
        
        cell = [[GFATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];  /// designates cell controller
        
    }
    
    cell.friendInfo = gitHubFriends[indexPath.row];  /// designates row for info
    cell.navigationController = self.navigationController;   //// this line MUST be added to share the naigation controller
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GFATableViewCell * cellH = [[GFATableViewCell alloc]init];
    
    cellH.xValue = 100;
    
 //      NSLog(@"cellH is %i",cellH.xValue);
    return cellH.xValue;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //   NSLog(@"select row at %@", indexPath);   /// listening here
    
    GFAViewController * profileView = [[GFAViewController alloc]init];/// create
    
    profileView.view.backgroundColor =[UIColor lightGrayColor];/// be sure to add a background
    
    profileView.friendInfo = gitHubFriends[indexPath.row];
    
    [self.navigationController pushViewController:profileView animated:YES];
}

-(void)searchButtonClicked
 {
 ///NSLog(@"search Button clicked");
     if ([searchTextbox.text isEqualToString:@""])
     {
         UIAlertView * noUserName = [[UIAlertView alloc] initWithTitle:@"No User Name" message:@"Please Input User Name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
         
         [noUserName show];
     } else {
         NSDictionary * userInfo = [GRAGitHubRequest requestUserInfo:searchTextbox.text];  /// calls requestUserInfo method from GRAGitHubRequest.m
         //// adds an object to the end   /// preferred method to insert to put at beginning (see below)
         ///    [gitHubFriends addObject:userInfo];
         
         //// adds an object to the beginning and
         [gitHubFriends insertObject:userInfo atIndex:0];
         
         [self.tableView reloadData];   /// reloads and refreshes data
         
         [GRAGitHubRequest saveUsers:gitHubFriends];   /// keeps updated data  ///called from GRAGitHubRequest.m
         
         [searchTextbox resignFirstResponder];  /// to close keyboard
     }
 }

 - (BOOL)textFieldShouldReturn:(UITextField *)textField  /// method to close keyboard
 {
 [textField resignFirstResponder];/// since we have a delegate, this will close keyboard (see UITextFieldDelegate at top
 return YES;   /// nothing executes after return
 }


 // Override to support conditional editing of the table view.      /// appletext   //// we uncommented to use this method
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }



 // Override to support editing the table view.         /// appletext   //// we uncommented to use this method for deleting cells
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
     
     [gitHubFriends removeObjectAtIndex:indexPath.row];   /// gets rid of 
     
     [GRAGitHubRequest saveUsers:gitHubFriends];
     
 // Delete the row from the data source         /// appletext   //// we uncommented to use this method
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 

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
