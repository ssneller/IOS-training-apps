//
//  STAEditItemViewController.m
//  Simple tasks
//
//  Created by Steve Sneller on 7/30/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "STAEditItemViewController.h"

@interface STAEditItemViewController () <UITextFieldDelegate>   // // set delgate for keyboard control, etc
{
    CGPoint point;
    UIButton * moveSpot;
    UIImage * moveImage;
    UIView * moveAll;
    UITextField * itemNameField;
}
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
    
    moveAll = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
 //   moveAll.backgroundColor = [UIColor greenColor];
    [self.view addSubview:moveAll];
    
    itemNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 80, 40)];        // // aloc and init textfield for single items to be edited
    itemNameField.text = self.itemInfo[@"name"];        // // gets item name
    itemNameField.delegate = self;                      // //  add delegate to self. neccessary for keyboard close
    itemNameField.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:itemNameField];
   [moveAll addSubview:itemNameField];
    
    moveImage = [UIImage imageNamed:@"Xkiaa.png"];
    moveSpot = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH -60, 60, 40, 40)];
    moveSpot.layer.backgroundColor = [UIColor clearColor].CGColor;
    [moveSpot setImage:moveImage forState:UIControlStateNormal];
//    [self.view addSubview:moveSpot];
    [moveAll addSubview:moveSpot];
    
    
//    [moveAll addTarget:self action: @selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDown];       // // tried to tie textfield and button together with UIView. It failed!!!
//     [moveAll addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];

    [itemNameField addTarget:self action: @selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDown];       // // adds itemNameField to the method
    [moveSpot addTarget:self action: @selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDown];      // // adds moveSpot to the method
    
    [itemNameField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];      // // adds itemNameField to the method
    [moveSpot addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];       // // adds moveSpot to the method

    // set initial background color  // // come back here
    
    float priority = [itemInfo[@"priority"]floatValue]; // // reads the priority value in the dictionary
    
    float priorityHue = priority/360 ; // // set to control HUE
    
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];  // // set to control HUE
    NSLog(@"set initial color here");

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField   // // boolean to true
{
    self.itemInfo[@"name"] = textField.text;        // // gets data from textfield
    [textField resignFirstResponder];           // // used to close keyboard
    
    return YES;
}


-(void) imageMoved:(id) sender withEvent:(UIEvent *) event
{
    point = [[[event allTouches] anyObject] locationInView:self.view];
//    NSLog(@"Point is %f", point);
//    UIControl *control = sender;
//    control = sender;
//    control.center = point;
//    [moveSpot setFrame:CGRectMake(SCREEN_WIDTH -60, _buttonYPosition -40, 80, 80)];
    [moveAll setFrame:CGRectMake(0, point.y - 50, SCREEN_WIDTH, 80)];
//    _buttonYPosition = point.y;
    [self changeColorWithLocation:point];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches allObjects][0];   // // turns NSSet to NSArray allows to get first item in array ??? 
    CGPoint location = [touch locationInView:self.view];        // // the point location is reported back by the movement to the view and becomes "location"
    [self changeColorWithLocation:location];        // // runs color change method below
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
       UITouch * touch = [touches allObjects][0];   // // turns NSSet to NSArray allows to get first item in array
        CGPoint location = [touch locationInView:self.view];
        [self changeColorWithLocation:location];
    
 //   [self changeColorWithLocation:[[touches allObjects][0] locationInView:self.view]];  // // this is above 3 lines in one
}



-(void)changeColorWithLocation:(CGPoint)location    // // changes color based on Y position .
{
    float priority = location.y /SCREEN_HEIGHT * 60;  // // Y touch changes HUE only up to yellow scale (1 to 60 of 360)
//    NSLog(@"Y = %f", _buttonYPosition);

    
    self.itemInfo[@"priority"] = @(priority);  // // this sets the "priority" color based on the reported number
    
    float priorityHue = (priority /360);        // // set as float
    
    self.view.backgroundColor =[UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];      // //  changes the background color (and cell color) to priorityHUE value
    
}



- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(BOOL)prefersStatusBarHidden { return YES; }     // // add to other VCs this removes the statusbar at top of window




@end
