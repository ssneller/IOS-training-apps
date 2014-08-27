//
//  MFCViewController.m
//  MyFaceIsCool-M
//
//  Created by Steve Sneller on 8/20/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MFCViewController.h"

#import <AVFoundation/AVFoundation.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface MFCViewController () <UIImagePickerControllerDelegate>

@end

@implementation MFCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
            message:@"Device has no camera"
            delegate:nil
            cancelButtonTitle:@"OK"
            otherButtonTitles: nil];
            
            [myAlertView show];
        }
    
        UIView * mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, SCREEN_WIDTH)];
        [self.view addSubview:mainView];
        
        UIImageView * photoView = [[ UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT * 0.8, SCREEN_WIDTH)];
        [self.view addSubview:photoView];
        
        UIButton * takePhoto = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 60, SCREEN_HEIGHT * 0.9, 120, 40)];
        takePhoto.backgroundColor = [UIColor lightGrayColor];
        takePhoto.layer.cornerRadius = 10;
        [takePhoto setTitle:@"Take Photo" forState:UIControlStateNormal];
        [takePhoto addTarget:self action:@selector(takePhoto:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:takePhoto];
        
        UIButton * selectPhoto = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 60, SCREEN_HEIGHT * 0.95, 120, 40)];
        selectPhoto.backgroundColor = [UIColor lightGrayColor];
        selectPhoto.layer.cornerRadius = 10;
        [selectPhoto setTitle:@"Select Photo" forState:UIControlStateNormal];
        [selectPhoto addTarget:self action:@selector(selectPhoto:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:selectPhoto];
        
//        UIButton * playSoundButton = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 60, SCREEN_HEIGHT * 0.8, 120, 40)];
//        selectPhoto.backgroundColor = [UIColor lightGrayColor];
//        selectPhoto.layer.cornerRadius = 10;
//        [selectPhoto setTitle:@"Select Photo" forState:UIControlStateNormal];
//        [selectPhoto addTarget:self action:@selector(playSound:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:selectPhoto];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}



- (IBAction)takePhoto:(UIButton *)sender;
{
    NSLog(@"TP");
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}



- (IBAction)selectPhoto:(UIButton *)sender;
{
    NSLog(@"SP");
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


//-(void) playSound
//    NSString * file = [[NSBundle mainBundle] pathForResource:@"everything2" ofType:@"wav"];
//    NSData * fileData = [NSData dataWithContentsOfFile:file];
//    AVAudioPlayer * audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:nil];



@end
