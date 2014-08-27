//
//  MAZDataViewController.m
//  PagedMaze
//
//  Created by Steve Sneller on 8/18/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MAZDataViewController.h"

@interface MAZDataViewController ()

@end

@implementation MAZDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

@end
