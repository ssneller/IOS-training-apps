//
//  STANewItemsViewController.m
//  Simple tasks
//
//  Created by Steve Sneller on 7/31/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "STANewItemsViewController.h"

@interface STANewItemsViewController () <UITextFieldDelegate>  // // set delegate

@end

@implementation STANewItemsViewController
{
    UIButton * saveButton;      // //   set global for variables
    UIButton * cancelButton;
    UIImage * saveButtonImage;
    UIImage * cancelButtonImage;
    UITextField * newItemNameTextField;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor orangeColor];     // // set background color so window is visible
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView* fieldBar = [[UIView alloc]initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40 , 1)];   // // this is bar across top of window
    fieldBar.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:fieldBar];
    
    float buttonSize = 100;  // // "buttonsize variable used below
    
    saveButtonImage = [UIImage imageNamed:@"item_save.png"];        // // save and cancel button images
    cancelButtonImage = [UIImage imageNamed:@"item_close.png"];
    
    // // alloc and init and using SCREEN_WIDTH constant
    saveButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2.0 + 10, SCREEN_WIDTH -150, buttonSize, buttonSize)];
    saveButton.layer.cornerRadius = buttonSize/2;
    [saveButton addTarget:self action:@selector(saveButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton setImage:saveButtonImage forState:UIControlStateNormal];
    [self.view addSubview:saveButton];
    
    // // alloc and init and using SCREEN_WIDTH constant
    cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2.0 - 110, SCREEN_WIDTH -150, buttonSize, buttonSize)];
    cancelButton.layer.cornerRadius = buttonSize/2;
    [cancelButton addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton setImage:cancelButtonImage forState:UIControlStateNormal];
    [self.view addSubview:cancelButton];
    
    UIView * moveBoth = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
//    moveBoth.backgroundColor = [UIColor clearColor];
    UIImage * moveImage = [UIImage imageNamed:@"Xkiaa.png"];
    UIButton * moveSpot = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH -60, 30, 40, 40)];
//    moveSpot.backgroundColor = [UIColor clearColor];
    [moveSpot setImage:moveImage forState:UIControlStateNormal];
    
    [moveSpot addTarget:self action: @selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDown];
    
    [moveSpot addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];

//    [self.view addSubview:moveSpot];
    //    [moveBoth addSubview:moveSpot];
    
    // // alloc and init and using SCREEN_WIDTH constant
    newItemNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(20,30, SCREEN_WIDTH -60, 40)];
//    newItemNameTextField.backgroundColor = [UIColor clearColor];
    newItemNameTextField.layer.borderColor = [UIColor blackColor].CGColor;
    newItemNameTextField.layer.cornerRadius = 5;
    [newItemNameTextField addTarget:self action: @selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDown];
    
    [newItemNameTextField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];

    //   newItemNameTextField.font = [UIFont fontWithName:@"Courier" size: 48.0];
    //   [newItemNameTextField setText:@"Item"];
//    [self.view addSubview:newItemNameTextField];
    
    [moveBoth addSubview:moveSpot];
    [moveBoth addSubview:fieldBar];
    [moveBoth addSubview:newItemNameTextField];
    [self.view addSubview:moveBoth];
    
    //  [moveBoth addSubview:moveSpot];
    //   [moveBoth addSubview:moveImage];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField  // // method to get data back from textfield
{
    // //self.itemInfo[@"name"] = textField.text;        // // gets data from textfield
    [textField resignFirstResponder]; // // since we have a delegate, this will close keyboard (see UITextFieldDelegate at top
    return YES;   // // TRUE
}


-(void)saveButtonClicked
{
    NSLog(@"save clicked %@", newItemNameTextField.text);
    [self.items addObject:[@{                       // // adds the Group objects and items in a subarray
                             @"name": newItemNameTextField.text,
                             @"priority":@0
                             
                             } mutableCopy]];  // // must be mutable copy to be able to change
    [self cancelButtonClicked];   // //    closes window after save  by calling cancel    // //
}



-(void)cancelButtonClicked
{
    NSLog(@"friggin cancel clicked");
    [self dismissViewControllerAnimated:YES completion:nil];   //  // returns to previous window "pops" the view
}



-(IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event
    {
            CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
            UIControl *control = sender;
            control.center = point;
        }


-(BOOL)prefersStatusBarHidden { return YES; }     // // add to other VCs this removes the statusbar at top of window


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
