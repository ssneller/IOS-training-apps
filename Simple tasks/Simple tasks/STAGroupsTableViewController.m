//
//  STAGroupsTableViewController.m
//  Simple tasks
//
//  Created by Steve Sneller on 7/30/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "STAGroupsTableViewController.h"    // // be sure to import the subclasses to the "master"
#import "STAItemsTableViewController.h"
#import "STANewGroupViewController.h"
#import "STANewItemsViewController.h"

@interface STAGroupsTableViewController ()

@end

@implementation STAGroupsTableViewController   // //We are starting here
{
    NSMutableArray * groups;   // // set as a global array to be accessable and changeable

}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization

        
        groups = [@[                    // // setup the first group array we are nesting Array, Dictionary, array, dictionary
                    
                    /*      // //  Starts here ////commented section is fake data to be replaced with new data from viewcontrollers
                     [@{                                         // // fake data to start
                        @"name": @"Movies To Watch",            // // first dictionary
                        @"items": [@[
                                     
                                     [@{
                                         @"name": @"Guardians of the galaxy",
                                         @"priority": @30
                                       
                                       } mutableCopy],
                                     [@{
                                         @"name": @"Expendables 3",
                                         @"priority": @40
                                         
                                         } mutableCopy],
                                     [@{
                                         @"name": @"TMNT",
                                         @"priority": @60
                                         
                                         }mutableCopy]
                                     
                                       ] mutableCopy]
                        } mutableCopy],
                    
                    [@{
                        @"name": @"Apps to Write",
                        @"items": [@[
                                     [@{
                                         @"name": @"Flappy Bird",
                                         @"priority": @60
                                         
                                         } mutableCopy],
                                     [@{
                                         @"name": @"Clear",
                                         @"priority": @40
                                         
                                         }mutableCopy],
                                     [@{
                                         @"name": @"BigIcons",
                                         @"priority": @30
                                         
                                         }mutableCopy],
                                     
                                     ] mutableCopy]
                        } mutableCopy]
                     // // ends here
                    */
                    ] mutableCopy];
        
        
        
        NSMutableArray * loadGroupsArray = [self loadGroupData]; //// alloc init the groups array
        if (loadGroupsArray)/// sets conditional if group is empty
        {
            groups = loadGroupsArray;   //// pass the array to loadGroupsArray Array
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];  ////eliminates cell == nil   //// may need to substitute custom cell class here
    
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);    //// puts the black bar all the way across the screen
    
    UIBarButtonItem * addNewGroup = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewGroupClicked)];    ///// adds the + sign in top right for creating new groups
    
    self.navigationItem.rightBarButtonItem = addNewGroup;///// adds the + sign in top right for creating new groups
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void)viewWillAppear:(BOOL)animated   // // runs after dismissVC runs
{
    
    [super viewWillAppear:animated]; // // be sure to use super here
//    NSLog(@"%@",groups);
    [self.tableView reloadData];   // //reloads the data
    [self saveGroupData];   // // added to save when this happens
}


-(void)addNewGroupClicked       // // method for adding new group
{
    STANewGroupViewController * addNewGroupVC = [[STANewGroupViewController alloc]init];
    
    addNewGroupVC.groups = groups;    // // be sure to add property to .h and this sets the access to the data under the STANewGroupViewController
    
    [self.navigationController presentViewController:addNewGroupVC animated:YES completion:nil];   // // goes to the "new group" // // present means that it will animiate from bottom  // // use push if using back button
}


- (void)didReceiveMemoryWarning // appletext
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}
*/


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section    // // use this to determine the number of items in view
{
    // Return the number of rows in the section.
    return groups.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath    // // cues the frame for vertical view
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = groups[indexPath.row][@"name"];
    
    // Configure the cell...
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath     // // calls the ItemsTVC when you choose group
{
    STAItemsTableViewController * itemsTVC = [[STAItemsTableViewController alloc]init];     // // alloc init STAItemsTableViewController
    
    itemsTVC.groupInfo = groups[indexPath.row];   // // row location of group // // gets the row index
    
    [self.navigationController pushViewController:itemsTVC animated:YES];  //  // using this push allows a "back button" // // use present if you want vertical animation
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.   // // must uncomment this section to get swipe to delete button
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        

       // // Delete the row from the data source
        [groups removeObjectAtIndex:indexPath.row];  // // added this line to remove object
        [self saveGroupData];   // // added to save data after removing object
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// //Need the 3 below to determine path, load the data, and save the data
- (void)saveGroupData       // // added to viewWillAppear and commitEditingStyle method to be sure that data is saved when view changes or reloads
{
    NSData * groupData = [NSKeyedArchiver archivedDataWithRootObject:groups];   // // the array is just data at this point
    [groupData writeToFile:[self groupFilePath] atomically:YES];    // // set GroupFilePath from below and atomically makes a temp backup
}


- (NSMutableArray *)loadGroupData       // // loads any "saved" data
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self groupFilePath]];    // // loads any "saved" data
}


- (NSString * )groupFilePath    // // gets file save path
{
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * path = documentDirectories[0];   // // be sure that this is documentDirectories
    
    // //   NSLog(@"my path is %@", path);
    
    return [path stringByAppendingPathComponent:@"groups.data"];   // // gives you the path for saving
    
}


// //this removes the statusbar at top of window
-(BOOL)prefersStatusBarHidden { return YES; }     // // add to other VCs this removes the statusbar at top of window



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
