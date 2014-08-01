//
//  STANewGroupViewController.m
//  Simple tasks
//
//  Created by Steve Sneller on 7/31/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "STANewGroupViewController.h"

@interface STANewGroupViewController ()<UITextFieldDelegate>


@end

@implementation STANewGroupViewController
{
    ///   UIButton * saveButton;       // // keep these if we need global variables.
    ///   UIButton * cancelButton;
    ///   UIImage * saveButtonImage;
    ///    UIImage * cancelButtonImage;
    UITextField * newGroupNameTextField;        // // only global variable here
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.view.backgroundColor = [UIColor whiteColor];       // // set background color so window is visible
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // //   NSLog(@"NG2");
    float buttonSize = 100;     // // defines size of save and cancel buttons
    
    UIView* fieldBar = [[UIView alloc]initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40 , 1)];     // // alloc init field bar view // //  small bar across top
    fieldBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:fieldBar];
    
    UIImage * saveButtonImage = [UIImage imageNamed:@"group_save.png"];     // // pics used for save and cancel buttons
    UIImage * cancelButtonImage = [UIImage imageNamed:@"group_close.png"];
    
    UIButton * saveButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2.0 + 10, 100, buttonSize, buttonSize)];       // // alloc init button using SCREEN_WIDTH constant
    saveButton.layer.cornerRadius = buttonSize/2;       // // rounds square to circle
    //  saveButton.backgroundColor = [UIColor grayColor];
    saveButton.adjustsImageWhenHighlighted = NO;
    [saveButton addTarget:self action:@selector(saveButtonClicked) forControlEvents:UIControlEventTouchUpInside];  // // adds target and sets clicked event for saving
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton setImage:saveButtonImage forState:UIControlStateNormal];
    [self.view addSubview:saveButton];
    
    
            // // alloc init button using SCREEN_WIDTH constant
    UIButton * cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2.0 - 110, 100, buttonSize, buttonSize)];
    cancelButton.layer.cornerRadius = buttonSize/2;     // // rounds square to circle
    // //  cancelButton.backgroundColor = [UIColor grayColor];
    cancelButton.adjustsImageWhenHighlighted = NO;
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
                    // // adds target and sets clicked event for canceling
    [cancelButton addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setImage:cancelButtonImage forState:UIControlStateNormal];
    [self.view addSubview:cancelButton];
    
            // // alloc init button using SCREEN_WIDTH constant
    newGroupNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 10, SCREEN_WIDTH -40, 50)];
    newGroupNameTextField.backgroundColor = [UIColor whiteColor];
    newGroupNameTextField.font = [UIFont fontWithName:@"Courier" size: 36.0];
    newGroupNameTextField.layer.cornerRadius = 5;
    newGroupNameTextField.layer.borderColor = [UIColor blackColor].CGColor;     // // must put .CGColor on bordercolor
    [newGroupNameTextField setText:@""];
    [self.view addSubview:newGroupNameTextField];
    
    [newGroupNameTextField becomeFirstResponder];   // // makes the text field active when opening window
    
    //  //    NSLog(@"%@", newGroupNameTextField.text);
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField  // // method to close keyboard
{
    // //self.itemInfo[@"name"] = textField.text;        // // gets data from textfield
    [textField resignFirstResponder];   // // since we have a delegate, this will close keyboard (see UITextFieldDelegate at top)
    return YES;   // // TRUE
}


-(void)saveButtonClicked        // // method to build dictionary that will be saved
{
    // //   NSLog(@"save clicked");
    [self.groups addObject:[@{                                      // // adds the Group objects and items in a subarray
                              @"name": newGroupNameTextField.text,
                              @"items":[@[] mutableCopy]
                              
                              } mutableCopy]];      // // must be mutable copy to be able to change
    
    NSLog(@"Group data is %d", newGroupNameTextField.text);
    [self cancelButtonClicked];   // //    closes window after save  by calling cancel    // //
}



-(void)cancelButtonClicked      // // cancel clicked  method
{
    // //    NSLog(@"cancel clicked");
    [self dismissViewControllerAnimated:YES completion:nil];   // // returns to previous window "pops" the view
}



-(BOOL)prefersStatusBarHidden { return YES; }     // // add to other VCs this removes the statusbar at top of window


@end
