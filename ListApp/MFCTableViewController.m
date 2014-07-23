//
//  MFCTableViewController.m
//  ListApp
//
//  Created by Steve Sneller on 7/23/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MFCTableViewController.h"

@interface MFCTableViewController ()

//@property (nonatomic) NSArray * listitems;

// create an array for students -NSStrings
//@property (nonatomic) NSArray * students;

//create an array for colors    - UIColors
//@property (nonatomic) NSArray * colors;

// create an array for sizes    - NSNumbers
//@property (nonatomic) NSArray   * sizes;

@property (nonatomic) NSArray * info;

@end

@implementation MFCTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        // Custom initialization
        
//        self.listitems = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday", @"Wednesday", @"Thursday", nil];
        
//        self.listitems = [NSArray arrayWithObjects:@"Monday", @"Tuesday", @"Wednesday", @"Thursday", nil];
        
        /// set 7 days
//        self.listitems = @[@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday"];   ///add the last 3 days/// easiest way using a literal
        
        ///set 7 students
//        self.students = @[@"Adam", @"Eve", @"ralph", @"sam", @"max", @"will", @"greg"];
        
        ///set 7 colors
//        self.colors = @[[UIColor redColor], [UIColor greenColor], [UIColor grayColor], [UIColor blueColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor purpleColor]];
        
        ///set 7 size numbers 20-40
//        self.sizes = @[@21, @24, @27, @30, @33, @36, @39];
        
        /// create dictionary
        
        self.info = @[
                      @{@"day":@"Monday",@"color":[UIColor redColor],@"student":@"Adam",@"size":@21},
                      @{@"day":@"Tuesday", @"color":[UIColor greenColor], @"student":@"Eve", @"size":@24},
                      @{@"day":@"Wednesday", @"color":[UIColor grayColor], @"student":@"Ralph", @"size":@27},
                      @{@"day":@"Thursday", @"color":[UIColor blueColor], @"student":@"Sam", @"size":@30},
                      @{@"day":@"Friday", @"color":[UIColor orangeColor], @"student":@"Max", @"size":@33},
                      @{@"day":@"Saturday", @"color":[UIColor yellowColor], @"student":@"Will", @"size":@36},
                      @{@"day":@"Sunday", @"color":[UIColor purpleColor], @"student":@"Greg", @"size":@39},
                      ];
        
 //       NSString * iC = self.listitems.count;
 //       NSLog(iC)
        
    }
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

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber * size = sizes[indexPath.row];

    return [size floatValue] * 2;
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];  /// IndexPath indicates table position
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"cell"];
    
//    NSString * listitem = self.listitems[indexPath.row];
    
    NSDictionary * infoItem = self.info[indexPath.row];
    
 //   NSLog(listitem);   /// lists all rows
    
    cell.textLabel.text = infoItem[@"day"];
    
    // there is a sub text that will be set by student names
//    NSString * student = self.students[indexPath.row];
    cell.detailTextLabel.text = infoItem[@"student"];
    
    //set background color to color in array
 //   cell.backgroundColor = [UIColor greenColor];
 //   UIColor * color = self.colors[indexPath.row];
//    -(UIColor)color;
//    NSString * newColor = [UIColor ]
    
    cell.backgroundColor = infoItem[@"color"];
    
    //set the text label font size to a number from last array
//    NSNumber * size = self.sizes[indexPath.row];
//    cell.textLabel.font = [UIFont systemFontSize
 //   cell.textLabel.font = [UIFont systemFontOfSize:[size intValue]];
    cell.textLabel.font = [UIFont systemFontOfSize:[infoItem[@"size"] intValue]];
    
 //   NSLog(@"WD is %@ Student is %@ Color is %@ Size is %@", listitem, student, color, size);
    
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
