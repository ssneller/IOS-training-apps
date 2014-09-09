//
//  ViewController.h
//  NewRailsApp
//
//  Created by Steve Sneller on 9/2/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *contextField;
- (IBAction)postNew:(UIButton *)sender;

- (IBAction)getMyPosts:(UIButton *)sender;

- (IBAction)getAllPosts:(UIButton *)sender;

@end

