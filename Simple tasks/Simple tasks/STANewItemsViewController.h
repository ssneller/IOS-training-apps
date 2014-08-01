//
//  STANewItemsViewController.h
//  Simple tasks
//
//  Created by Steve Sneller on 7/31/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STANewItemsViewController : UIViewController

@property (nonatomic) NSMutableDictionary * itemInfo;       // // this property shares groups publicly
@property (nonatomic) NSMutableArray * items;

@end
