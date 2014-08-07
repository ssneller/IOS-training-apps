//
//  STAEditItemViewController.h
//  Simple tasks
//
//  Created by Steve Sneller on 7/30/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STAEditItemViewController : UIViewController

@property (nonatomic) NSMutableDictionary * itemInfo;   // // makes the itemInfo public
@property(nonatomic) BOOL showsReorderControl;
@property (nonatomic) float buttonYPosition;

@end
