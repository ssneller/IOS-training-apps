//
//  GFATableViewController.m
//  Github Friend
//
//  Created by Rene Candelier on 7/24/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "GFATableViewController.h"
#import "GFATableViewCell.h"
#import <QuartzCore/QuartzCore.h>
@interface GFATableViewController ()
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
        gitHubFriends = [@[ @{
                           
                           @"login": @"joalbright",
                           @"name":@"Jo Albright",
                           @"blog": @"jo2.co",
                           @"location":@"Atlanta, GA",
                           @"email":@"me@jo2.com",
                           @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
                           @"followers":@"20",
                           @"following":@"22"
                           
                           },
                            
                            @{
                                @"name":@"Jo Albright",
                                @"login": @"josephlausf",
                                @"location":@"Atlanta, GA",
                                @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
                                @"followers":@"20",
                                @"following":@"22"
                                },
                            
                            @{
                                @"name":@"Jo Albright",
                                @"login": @"josephlausf",
                                @"location":@"Atlanta, GA",
                                @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
                                @"followers":@"20",
                                @"following":@"22",
                                },
                            
                            @{
                                @"name":@"Jo Albright",
                                @"login": @"josephlausf",
                                @"location":@"Atlanta, GA",
                                @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
                                @"followers":@"20",
                                @"following":@"22",
                                },
                            
                            @{
                                @"name":@"Jo Albright",
                                @"login": @"josephlausf",
                                @"location":@"Atlanta, GA",
                                @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
                                @"followers":@"20",
                                @"following":@"22",
                                },
                            
                            @{
                                @"name":@"Jo Albright",
                                @"login": @"josephlausf",
                                @"location":@"Atlanta, GA",
                                @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
                                @"followers":@"20",
                                @"following":@"22",
                                },
                            
                            @{
                                @"name":@"Jo Albright",
                                @"login": @"joalbright",
                                @"location":@"Atlanta, GA",
                                @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
                                @"followers":@"20",
                                @"following":@"22",
                                }
                            /// end of dictionary
                           ]mutableCopy];
        
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];///spaces the cells down
    
    self.tableView.tableHeaderView = headerView;
    
    //top line
    CGRect sepFrame = CGRectMake(0, headerView.frame.size.height-1, 320, 1);
    UIView * seperatorView = [[UIView alloc] initWithFrame:sepFrame];
    seperatorView.backgroundColor = [UIColor blackColor];
    [headerView addSubview:seperatorView];
    
    
    //Setting the search box
    searchTextbox = [[UITextField alloc]initWithFrame:CGRectMake(10, 50, 250, 40)];
    [searchTextbox setBorderStyle:UITextBorderStyleLine];
    [headerView addSubview:searchTextbox];
    
    //adding search button
    searchButton = [[UIButton alloc]initWithFrame:CGRectMake(270, 50, 40, 40.0)];
    searchButton.backgroundColor = [UIColor colorWithRed:0.667f green:0.655f blue:0.639f alpha:1.0f];
    [headerView addSubview:searchButton];
    
    //Circle Radius
    searchButton.layer.cornerRadius = 40.0/2.0;
    [searchButton addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside
     ];
    
    [self.tableView setSeparatorColor:[UIColor blackColor]];
    
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    


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
        
        cell = [[GFATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    
    cell.friendInfo = gitHubFriends[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
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
