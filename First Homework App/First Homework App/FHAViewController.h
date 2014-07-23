//
//  FHAViewController.h
//  First Homework App
//
//  Created by Steve Sneller on 7/21/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FHAViewController : UIViewController

//  2 text fields (username, password)
@property (weak, nonatomic) IBOutlet UITextField *usernameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

//  3 labels (username = username.text, passowrd = password.text, error = error message for 3 different conditions (empty UN PW or both)
@property (weak, nonatomic) IBOutlet UILabel *errorTextField;

//  2 buttons (login, reset) (reset sets all back to original)
- (IBAction)loginButtonClicked:(id)sender;
- (IBAction)resetButtonClicked:(id)sender;

//  3 buttons (no text diferent background colors, when you tap them, change the view background color to match the button)
- (IBAction)button1Clicked:(id)sender;
- (IBAction)button2Clicked:(id)sender;
- (IBAction)button3Clicked:(id)sender;

@end
