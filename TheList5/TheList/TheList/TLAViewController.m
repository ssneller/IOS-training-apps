//
//  TLAViewController.m
//  TheList
//
//  Created by Steve Sneller on 8/22/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "TLAViewController.h"

@interface TLAViewController () <UITableViewDelegate, UITableViewDataSource> // // set delegates

@end

@implementation TLAViewController
{
    NSMutableArray * niceArray; // // set 1st array
    NSMutableArray * naughtyArray;      // // set 2nd array
    UITextField * listNameField;
    UISegmentedControl * listOption;
    UITabBarController * tabBarC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    niceArray = [@[@"Helper Robots", @"Some Humans"] mutableCopy]; // // fill arrays
    naughtyArray = [@[@"Invading Robots", @"Killer Robots", @"jaws"] mutableCopy];
    
    // // setup barcontroller
    tabBarC = [[UITabBarController alloc]init];
    [self.view addSubview:tabBarC.view];
    [self addChildViewController:tabBarC];
    
    UITableViewController * niceList = [[UITableViewController alloc]init];     // // 1st TVC for 1st list
    niceList.title = @"Nice";
    niceList.tableView.dataSource = self;
    niceList.tableView.delegate = self;
    niceList.tableView.tag = 0;
    [niceList.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    niceList.tabBarItem.image = [UIImage imageNamed:@"nice.png"];
    
    UITableViewController * naughtyList = [[ UITableViewController alloc] init];        // // 2nd TVC for 2nd list
    naughtyList.title = @"Naughty";
    naughtyList.tableView.dataSource = self;
    naughtyList.tableView.delegate = self;
    naughtyList.tableView.tag = 1;
    [naughtyList.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    naughtyList.tabBarItem.image = [UIImage imageNamed:@"naughty.png"];
    
    
    UIViewController * addToList = [[UIViewController alloc]init];
    addToList.tabBarItem.image = [UIImage imageNamed:@"plus-64.png"];
    [addToList setTitle:@"Add To List"];
    
    listNameField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH -40, 40)];
    listNameField.backgroundColor = [UIColor lightGrayColor];
    listNameField.layer.cornerRadius = 10;
    [addToList.view addSubview:listNameField];
    
    
    listOption = [[UISegmentedControl alloc]initWithFrame:CGRectMake(10, 60, SCREEN_WIDTH, 40)];
    listOption.tintColor = [UIColor lightGrayColor];
    [listOption insertSegmentWithTitle:@"Nice" atIndex:0 animated:YES];
    [listOption insertSegmentWithTitle:@"Naughty" atIndex:1 animated:YES];
    [addToList.view addSubview:listOption];
    
    
    UIButton * addButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 110, SCREEN_WIDTH - 20, 40)];
    addButton.tintColor = [UIColor lightGrayColor];
    addButton.backgroundColor = addButton.tintColor;
    addButton.layer.cornerRadius = 10;
    [addButton setTitle:@"Add New Item" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addNewItem) forControlEvents:UIControlEventTouchUpInside];
    [addToList.view addSubview:addButton];
    
    
    tabBarC.viewControllers = @[niceList, naughtyList, addToList];
    
}

-(void)addNewItem
{
    NSLog(@"clicked");
    
//            NSArray * itemArray = (listOption.selectedSegmentIndex) ? naughtyArray : niceArray;
//            itemArray = itemArray[listNameField.text];
    
    switch(listOption.selectedSegmentIndex) {
            
        case 0:
        {
            [niceArray addObject:listNameField.text];
            break;
        }
        case 1:
        {
            [naughtyArray addObject:listNameField.text];
            break;
        }
        default :
            NSLog(@"bad");
    }
    
    listNameField.text = @"";
    [listNameField resignFirstResponder];
    
//    tabBarC.viewControllers[listOption.selectedSegmentIndex] = [reloadData];
    
//    (tabBarC.viewControllers[listOption.selectedSegmentIndex] as UITableViewController).tableView.reloadData();
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSIndexPath *)indexPath
{
    if (tableView.tag == 0)
    {
        return niceArray.count;
    }
    
    if (tableView.tag == 1)
    {
        return  naughtyArray.count;
    }
    
    return  0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray * itemArray;
    
    if (tableView.tag == 0)
    {
        itemArray = niceArray;
    }
    
    if (tableView.tag == 1)
    {
        itemArray =  naughtyArray;
    }
    
    cell.textLabel.text = itemArray[indexPath.row];
    
    return  cell;
    
}



-(BOOL)prefersStatusBarHidden { return YES; }

@end
