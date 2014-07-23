//
//  ViewController.m
//  Crystal Ball
//
//  Created by Steve Sneller on 7/18/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "ViewController.h"
#import "SS_CrystalBall.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.crystalBall = [[SS_CrystalBall alloc] init];
    
 //   self.predictions = [[NSArray alloc] initWithObjects:@"It is certain", @"probably", @"Stars are not aligned", @"No", @"Probably Not", @"I just don't know", @"Hell No!!!", nil];
    
  //  self.predictionLabel.text = [predictions objectAtIndex:4];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed {
   // NSLog(@"Button Pressed");

 //   int random = arc4random_uniform(6);  /// Tried to use "self.predictions.count but got error and unsigned integer . Said it was a LONG, so I just gave it a value (6)
 //   self.predictionLabel.text = [self.predictions objectAtIndex:random];
    self.predictionLabel.text = [self.crystalBall randomPrediction];
   // NSString *ttt = self.predictionLabel.text;   ///added thes 2 lines to test text output
   // NSLog(@"text is %@", ttt);
    
   // self.predictionLabel.text = [self.predictions objectAtIndex:4]; // note: added 2nd self so it knows where to look
    
}



@end