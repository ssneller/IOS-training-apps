//
//  ViewController.h
//  Crystal Ball
//
//  Created by Steve Sneller on 7/18/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SS_CrystalBall;   //// fortward declaration

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
@property (strong, nonatomic) SS_CrystalBall *crystalBall;

- (IBAction)buttonPressed;



@end

