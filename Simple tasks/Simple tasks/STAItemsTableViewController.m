//
//  STAItemsTableViewController.m
//  Simple tasks
//
//  Created by Steve Sneller on 7/30/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "STAItemsTableViewController.h"
#import "STAEditItemViewController.h"       // // import these to have access to these classes
#import "STANewItemsViewController.h"

@interface STAItemsTableViewController ()

@end

@implementation STAItemsTableViewController



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
         // Custom initialization  // // insert data here
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;  // // set background color for new VC window
        
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];  // //eliminates cell == nil   // // may need to substitute custom cell class here
    
    UIBarButtonItem * addNewItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItemClicked)];    // // adds the + sign in top right for creating new itemss
    
    self.navigationItem.rightBarButtonItem = addNewItem;        // // adds the + sign in top right for creating new itemss
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)viewWillAppear:(BOOL)animated       // // runs after dismissVC runs
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];        // // reloads and updates the data need this for current data status
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
/* sss
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}
*/


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSMutableArray * items = self.groupInfo[@"items"];  // // must create MutableArray so we can count
    
   // // items = self.groupInfo[@"items"];
    return items.count;     // // counts items
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath   // // this method changes the cell background
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];   // //
    
    // Configure the cell...
    
    float priority = [self.groupInfo[@"items"][indexPath.row][@"priority"] floatValue]; // // reads the priority value in the dictionary
    
    float priorityHue = priority/360 ; // // set to control HUE
    
    cell.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];  // // set to control HUE
    
    cell.textLabel.text = self.groupInfo[@"items"][indexPath.row][@"name"];   // //at array point // // where it happens
    
    return cell;
}


- (void)addNewItemClicked  // // this references the NewitemVC and sends the window for editing the single item
{
     STANewItemsViewController * addItemVC = [[STANewItemsViewController alloc]init];   // //VC for adding single items
    
        addItemVC.items = self.groupInfo[@"items"];         // // where it is working
    
    [self.navigationController presentViewController:addItemVC animated:YES completion:nil];    // // pushes the controller and adds a "back" button to the top
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  // // this references the edititemVC and sends the window for editing the single item
{
    
    STAEditItemViewController * editItemVC = [[STAEditItemViewController alloc]init]; // //VC for editing single items
    
    editItemVC.itemInfo = self.groupInfo[@"items"][indexPath.row];  // // where it is working
    
    [self.navigationController pushViewController:editItemVC animated:YES]; // // pushes the controller and adds a "back" button to the top
    
}


-(BOOL)prefersStatusBarHidden { return YES; }     // // add to other VCs this removes the statusbar at top of window


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        // Delete the row from the data source
        [self.items removeObjectAtIndex:indexPath.row]; // // added this line to remove object
 //       [self.groupInfo removeObjectAtIndex:indexPath.row];  // // added this line to remove object
        
        
 //       [self saveGroupData];   // // added to save data after removing object
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


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
