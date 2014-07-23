//
//  FHAViewController.m
//  First Homework App
//
//  Created by Steve Sneller on 7/21/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "FHAViewController.h"

@interface FHAViewController ()

@end

@implementation FHAViewController

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
    // get username text  /// create the variable and ask for the property
    NSString *username = self.usernameText.text;    /// Type * variable = self.item.property
    NSLog(@"username = %@", username);              /// print out the result to the console
    // get password text   /// create the variable and ask for the property
    NSString *password = self.passwordText.text;    /// Type * variable = self.item.property
    NSLog(@"password = %@", password);              /// print out the result to the console
    NSLog(@"username = %@ and password is %@", username, password);/// print out the result to the console
    
/// this section tests if the UN, then PW, then both to see if they exist and then change the error label text to show result
    
    if ([self.usernameText.text isEqualToString:@""])/// Test to see if empty
    {
        NSLog(@"Username is empty");        /// print out the result to the console
        self.errorTextField.text = @"No user name"; /// changes the error label to what value we see as the result
        
    }
    if ([self.passwordText.text isEqualToString:@""]) /// 2nd test for the password
    {
        NSLog(@"password is empty");    /// print out the result to the console
        self.errorTextField.text = @"No password";      /// changes the error label to what value we see as the result
    }
    
    if ([self.usernameText.text isEqualToString:@""] &&  [self.passwordText.text isEqualToString:@""]) {
        NSLog(@"Input UN & PW");    /// print out the result to the console
        self.errorTextField.text = @"No user name or password";     /// changes the error label to what value we see as the result
    }
 ////   NSString *UN = usernameText.text;
 ////   NSString *PW = passwordText.text;
        self.errorTextField.text = @"complete login OK";
 ////       self.errorTextField.text = UN & " " & PW;
}

    - (IBAction)resetButtonClicked:(id)sender   ///Reset button to clear eveything text values and background color
    {
        NSLog(@"Reset");            /// print out the result to the console
        self.usernameText.text =@"";        /// set the username, password, background color back to nil
        self.passwordText.text =@"";
        self.view.backgroundColor = [UIColor whiteColor];
        self.errorTextField.text = @"";
    }
    - (IBAction)button1Clicked:(id)sender ///button1
    {
        self.view.backgroundColor = [UIColor greenColor];  ///set colors via buttons
    }

    - (IBAction)button2Clicked:(id)sender       ///button2
    {
                self.view.backgroundColor = [UIColor redColor];     ///set colors via buttons
    }

    - (IBAction)button3Clicked:(id)sender       ///button3
    {
              self.view.backgroundColor = [UIColor yellowColor];    ///set colors via buttons
    }


@end
