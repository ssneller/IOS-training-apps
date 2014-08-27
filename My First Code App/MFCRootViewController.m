//
//  MFCRootViewController.m
//  My First Code App
//
//  Created by Steve Sneller on 7/22/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MFCRootViewController.h"

@interface MFCRootViewController ()  <UITextFieldDelegate>

@end

@implementation MFCRootViewController
{
    ///Declare global instance variable here  /// will be used throughout code
    UILabel * someLabel;
    UITextField * usernameField;
    UITextField * passwordField;
    UITextField * emailField;
    UITextField * phoneField;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization  /// init here
        NSLog(@"init");   /// added to print status
        self.view.backgroundColor = [UIColor blueColor]; /// UIColor is the class and greenColor is class method for UIColor
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /// My code starts here
    int screenHeight = [UIScreen mainScreen].bounds.size.height; ///this indicates the boundary of the screen
    int screenWidth = [UIScreen mainScreen].bounds.size.width;    /// we use this as a method to scale the login button location at the bottom
    
    ///login button
    UIButton * loginButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0, screenHeight -60.0, screenWidth - 20.0, 50.0)]; /// button location and size
    loginButton.backgroundColor = [UIColor cyanColor]; /// set background color
    loginButton.layer.cornerRadius = 10;  /// rounds the corners
    [loginButton setTitle:@"Login" forState:UIControlStateNormal]; /// Normal is standard /// for a button, use setTitle instead of .text
    [loginButton addTarget:self action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside]; /// addtarget is object, action is selector
    [self.view addSubview:loginButton];    /// use brackets as a wrapper ///must addview or it is not visible
    
    ///reset button
    UIButton * resetButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0, screenHeight -120.0, screenWidth - 20.0, 50.0)]; /// button location and size
    resetButton.backgroundColor = [UIColor blackColor]; /// set background color
    resetButton.layer.cornerRadius = 10;
    [resetButton setTitle:@"Reset" forState:UIControlStateNormal]; /// Normal is standard /// for a button, use setTitle instead of name
    [resetButton addTarget:self action:@selector(resetButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetButton];    /// use brackets as a wrapper ///must addview or it is not visible
    
    /// creating circle buttons
    UIButton * greenButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 280, 50, 50)];///create a 50x50 rect and radius corners to 25 for round button
    greenButton.backgroundColor = [UIColor greenColor]; /// set background color
    greenButton.layer.cornerRadius = 25;        /// makes 50x50 rectangle round
    [greenButton addTarget:self action:@selector(greenButtonClicked) forControlEvents:UIControlEventTouchUpInside]; ///Don't forget to create the method gbClicked
    [self.view addSubview:greenButton];     ///must addview or it is not visible
    
    UIButton * redButton = [[UIButton alloc] initWithFrame:CGRectMake(70, 280, 50, 50)];  ///we are offsetting in X only
    redButton.backgroundColor = [UIColor redColor]; /// set background color
    redButton.layer.cornerRadius = 25;
    [redButton addTarget:self action:@selector(redButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton];       ///must addview or it is not visible
    
    UIButton * yellowButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 280, 50, 50)];
    yellowButton.backgroundColor = [UIColor yellowColor]; /// set background color
    yellowButton.layer.cornerRadius = 25;
    [yellowButton addTarget:self action:@selector(yellowButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yellowButton];        ///must addview or it is not visible
    
    UIButton * orangeButton = [[UIButton alloc] initWithFrame:CGRectMake(190, 280, 50, 50)];
    orangeButton.backgroundColor = [UIColor orangeColor]; /// set background color
    orangeButton.layer.cornerRadius = 25;
    [orangeButton addTarget:self action:@selector(orangeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:orangeButton];        ///must addview or it is not visible
    
    UIButton * purpleButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 280, 50, 50)];
    purpleButton.backgroundColor = [UIColor purpleColor]; /// set background color
    purpleButton.layer.cornerRadius = 25;
    [purpleButton addTarget:self action:@selector(purpleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:purpleButton];        ///must addview or it is not visible
    
    /// user name data
    usernameField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 30.0, screenWidth - 20.0, 50.0)];
    usernameField.backgroundColor = [UIColor whiteColor];       /// set background color
    usernameField.layer.cornerRadius = 10.0;
    usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone; /// no caps for username ///not mandatory but helpful
    usernameField.autocorrectionType = UITextAutocorrectionTypeNo;      ///not mandatory but helpful
    usernameField.placeholder = @"username";        /// placeholder is dim text in field  ///not mandatory but helpful
    usernameField.delegate = self; /// need this for closing keyboard /// only has to be done once for a view???
    /// padding is used to shift data to the right
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];  /// this moves the text to the right by creating a small rec
    usernameField.leftView= paddingView;    ///starts on the left. origin is relative to top left corner
    usernameField.leftViewMode = UITextFieldViewModeAlways; ///must be activated to keep it working during a reset
    [self.view addSubview:usernameField];       ///must addview or it is not visible
    
    /// password data
    passwordField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 90.0, screenWidth - 20.0, 50.0)];
    passwordField.backgroundColor = [UIColor whiteColor];
    passwordField.layer.cornerRadius = 10;
    passwordField.secureTextEntry = YES;
    passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordField.placeholder = @"password";
    passwordField.delegate = self;  /// need this for closing keyboard /// only has to be done once for a view???
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];  /// must be added for each textfield or it will only see the last one
    passwordField.leftView= paddingView;
    passwordField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:passwordField];
    
    /// email data
    emailField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 150.0, screenWidth - 20.0, 50.0)];
    emailField.backgroundColor = [UIColor whiteColor];
    emailField.layer.cornerRadius = 10;
    emailField.keyboardType = UIKeyboardTypeEmailAddress;   /// use to change kyboard type for email
    emailField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    emailField.autocorrectionType = UITextAutocorrectionTypeNo;
    emailField.placeholder = @"email address";
    emailField.delegate = self;     /// need this for closing keyboard /// only has to be done once for a view???
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    emailField.leftView= paddingView;
    emailField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:emailField];
    
    /// phone data
    phoneField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 210.0, screenWidth - 20.0, 50.0)]; /// uses global varible declared at top
    phoneField.backgroundColor = [UIColor whiteColor];
    phoneField.layer.cornerRadius = 10;
    phoneField.keyboardType = UIKeyboardTypePhonePad;       /// use to change kyboard type for phone
    phoneField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    phoneField.autocorrectionType = UITextAutocorrectionTypeNo;
    phoneField.placeholder = @"phone number";
    phoneField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    phoneField.leftView= paddingView;
    phoneField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:phoneField];
}
/// end of buttons and textfields

/// start of methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField  /// method to close keyboard
{
    [textField resignFirstResponder];/// since we have a delegate, this will close keyboard (see UITextFieldDelegate at top
    return YES;   /// nothing executes after return
}

-(void)loginButtonClicked   /// loginBrutton method /// we are not doing anything here...
{
    ///   self.view.backgroundColor = [UIColor whiteColor];   /// changes background color when button is clicked
    NSLog(@"Button Clicked");   /// added to print status
}

-(void)resetButtonClicked   /// reset button method puts all back to original state
{
    usernameField.text = @"";
    passwordField.text = @"";
    emailField.text = @"";
    phoneField.text = @"";
    self.view.backgroundColor = [UIColor blueColor];
}

-(void)greenButtonClicked   /// greenbutton method to change background color
{
    self.view.backgroundColor = [UIColor greenColor];
}

-(void)redButtonClicked   /// redbutton method
{
    self.view.backgroundColor = [UIColor redColor];
}

-(void)yellowButtonClicked   /// yellowbutton method
{
    self.view.backgroundColor = [UIColor yellowColor];
}

-(void)orangeButtonClicked   /// orangebutton method
{
    self.view.backgroundColor = [UIColor orangeColor];
}

-(void)purpleButtonClicked   /// purplebutton method
{
    self.view.backgroundColor = [UIColor purpleColor];
}
///end of my methods

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
