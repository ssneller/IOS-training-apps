//
//  SFAViewController.m
//  Simple Form App
//
//  Created by Steve Sneller on 7/21/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "SFAViewController.h"

@interface SFAViewController ()

@end

@implementation SFAViewController

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

- (IBAction)loginButtonClicked:(id)sender
{
    // get username text
    NSString *username = self.usernameTextField.text;
    NSLog(@"username = %@", username);
    // get password text
    NSString *password = self.passwordTextField.text;
    NSLog(@"password = %@", password);
    NSLog(@"username = %@ and password is %@", username, password);
    {
    // check if the fields are empty
    if ([self.usernameTextField.text isEqualToString:@""]);
    }
// warn empty string
    
    UIAlertView * noUserName = [[UIAlertView alloc] initWithTitle:@"failed login" message:@"please input user name" delegate:self cancelButtonTitle:@"whatever" otherButtonTitles:nil];
    
    [noUserName show];
    
    NSLog(@"username is empty... Tell user to fill in");
    
    // try login submission success
    
    
}

@end
