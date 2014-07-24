//
//  MFCTableViewController.m
//  ListApp
//
//  Created by Steve Sneller on 7/23/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MFCTableViewController.h"

@interface MFCTableViewController ()

/// create an array for the dictionary information
@property (nonatomic) NSArray * info;

@end

@implementation MFCTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        // Custom initialization
        
        /// create dictionary
        /// set key, then value in pairs "{}" around groups
        self.info = @[
                      @{@"day":@"Monday",@"color":[UIColor redColor],@"student":@"Adam",@"size":@21},
                      @{@"day":@"Tuesday", @"color":[UIColor greenColor], @"student":@"Eve", @"size":@24},
                      @{@"day":@"Wednesday", @"color":[UIColor grayColor], @"student":@"Ralph", @"size":@27},
                      @{@"day":@"Thursday", @"color":[UIColor blueColor], @"student":@"Sam", @"size":@30},
                      @{@"day":@"Friday", @"color":[UIColor orangeColor], @"student":@"Max", @"size":@33},
                      @{@"day":@"Saturday", @"color":[UIColor yellowColor], @"student":@"Will", @"size":@36},
                      @{@"day":@"Sunday", @"color":[UIColor purpleColor], @"student":@"Greg", @"size":@39},
                      ];
    }                   ///end dictionary
    return self;
}

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
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.info.count;    /// keeps list count dynamic
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * infoItem = self.info[indexPath.row];

 ///   NSNumber * size = sizes[indexPath.row];
 //   NSNumber * size = [infoItem[@"size"]];
    ///return [size floatValue] * 2;
    return [infoItem[@"size"] floatValue] * 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"cell"];/// I have no idea what is happening here...
    
    /// my dictionary code starts here
    /// this creates an array of each info item and calls it "infoItem"
    NSDictionary * infoItem = self.info[indexPath.row];
    /// pull  day items from Dictionary. day is the key and the weekday is the value
    cell.textLabel.text = infoItem[@"day"];
    ///  student names
    cell.detailTextLabel.text = infoItem[@"student"];
    //set background color to color in dictionary
    cell.backgroundColor = infoItem[@"color"];
    //set the text label font size to a number from last array
    cell.textLabel.font = [UIFont systemFontOfSize:[infoItem[@"size"] intValue]];   /// intValue changes font size (float) to integer
    
 //   NSLog(@"WD is %@ Student is %@ Color is %@ Size is %@", listitem, student, color, size);
    /// my dictionary code ends here
    
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
