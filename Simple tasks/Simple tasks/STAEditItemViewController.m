//
//  STAEditItemViewController.m
//  Simple tasks
//
//  Created by Steve Sneller on 7/30/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "STAEditItemViewController.h"

@interface STAEditItemViewController () <UITextFieldDelegate>   // // set delgate for keyboard control, etc

@end

@implementation STAEditItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = [UIColor whiteColor];   // // be sure to set a background color for a new window
        
        // Custom initialization
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
}


-(void)setItemInfo:(NSMutableDictionary *)itemInfo  // // this creates a text field of the selected item for editing
{
    _itemInfo = itemInfo;
    
    UITextField * itemNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40, 40)];        // // aloc and init textfield for single items to be edited
    itemNameField.text = self.itemInfo[@"name"];        // // gets item name
    itemNameField.delegate = self;                      // //  add delegate to self. neccessary for keyboard close
    [self.view addSubview:itemNameField];
    
    // set background color  // // come back here
    
    float priority = [itemInfo[@"priority"]floatValue]; // // reads the priority value in the dictionary
    
    float priorityHue = priority/360 ; // // set to control HUE
    
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];  // // set to control HUE

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField   // // boolean to true
{
    self.itemInfo[@"name"] = textField.text;        // // gets data from textfield
    [textField resignFirstResponder];           // // used to close keyboard
    
    return YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches allObjects][0];   // // turns NSSet to NSArray allows to get first item in array
    
    CGPoint location = [touch locationInView:self.view];        // // the point location is reported back by the movement to the view and becomes "location"
    
    [self changeColorWithLocation:location];        // // runs color change method below
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
 //   UITouch * touch = [touches allObjects][0];   // // turns NSSet to NSArray allows to get first item in array
    
//    CGPoint location = [touch locationInView:self.view];
    
//    [self changeColorWithLocation:location];
    
    [self changeColorWithLocation:[[touches allObjects][0] locationInView:self.view]];  // // this is above 3 lines in one
    
    }



-(void)changeColorWithLocation:(CGPoint)location    // // changes color based on Y position .
{
    float priority = location.y /SCREEN_HEIGHT * 60;  // // Y touch changes HUE only up to yellow scale (1 to 60 of 360)
    
 ///   NSLog(@"y = %f", priority / 60);
    
    self.itemInfo[@"priority"] = @(priority);  // // this sets the "priority" color based on the reported number
    
    float priorityHue = (priority /360);        // // set as float
    
    self.view.backgroundColor =[UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];      // //  changes the background color (and cell color) to priorityHUE value
    
}


-(BOOL)prefersStatusBarHidden { return YES; }     // // add to other VCs this removes the statusbar at top of window


@end
