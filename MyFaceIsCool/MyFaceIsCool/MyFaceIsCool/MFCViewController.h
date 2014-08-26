//
//  MFCViewController.h
//  MyFaceIsCool
//
//  Created by Steve Sneller on 8/20/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFCViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@end
