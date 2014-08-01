//
//  STAItemsTableViewController.h
//  Simple tasks
//
//  Created by Steve Sneller on 7/30/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STAItemsTableViewController : UITableViewController

@property (nonatomic) NSMutableDictionary * groupInfo;  // // setting export properties from STAItemsTableViewController
@property (nonatomic) NSMutableDictionary * itemInfo;
@property (nonatomic) NSMutableArray * items;

@end
