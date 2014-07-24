//
//  MFCTableViewController.m
//  ListApp
//
//  Created by Steve Sneller on 7/23/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MFCTableViewController.h"

@interface MFCTableViewController ()
/// declare properties for arrays
/// create array for weekdays -NNStrings
@property (nonatomic) NSArray * listitems;
// create an array for students -NSStrings
@property (nonatomic) NSArray * students;
//create an array for colors    - UIColors
@property (nonatomic) NSArray * colors;
// create an array for sizes    - NSNumbers
@property (nonatomic) NSArray   * sizes;

@end

@implementation MFCTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        // Custom initialization
        
/// My code starts here
        /// set 7 days
        self.listitems = @[@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday"]; /// easiest way using a literal
        ///set 7 students
        self.students = @[@"Adam", @"Eve", @"ralph", @"sam", @"max", @"will", @"greg"];
        ///set 7 colors
        self.colors = @[[UIColor redColor], [UIColor greenColor], [UIColor grayColor], [UIColor blueColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor purpleColor]];/// be sure to include brackets to use entire class method
        ///set 7 size numbers 20-40
        self.sizes = @[@21, @24, @27, @30, @33, @36, @39];
    }
    return self;
}
/// Array code ends here
- (void)viewDidLoad
{
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.listitems.count;    /// keeps list count dynamic
}

     /// method to scale cell height based on font size
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber * size = self.sizes[indexPath.row];

    return [size floatValue] * 2;
}
///Scale cell method ends here

/// Method to display all arrays starts here
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"cell"];
    /// lists all rows
    NSString * listitem = self.listitems[indexPath.row];
    cell.textLabel.text = listitem;
    // set sub text for student names
    NSString * student = self.students[indexPath.row];///since students is name of array we use student to represent single item
    cell.detailTextLabel.text = student;
    //set background color to color in array
    UIColor * color = self.colors[indexPath.row];
    cell.backgroundColor = color;
    //set the text label font size to a number from last array
    NSNumber * size = self.sizes[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:[size intValue]];
    /// added below line to see all variables
 ///   NSLog(@"WD is %@ Student is %@ Color is %@ Size is %@", listitem, student, color, size);
        // Configure the cell...
    return cell;
}

/// my code ends here

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
