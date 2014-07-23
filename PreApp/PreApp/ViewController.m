//
//  ViewController.m
//  PreApp
//
//  Created by Steve Sneller on 7/21/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender
{
    NSLog(@"Button clicked");
    self.textLabel.text = (@"Button Clicked");
}
@end
