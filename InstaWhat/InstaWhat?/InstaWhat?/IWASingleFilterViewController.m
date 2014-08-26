//
//  IWASingleFilterViewController.m
//  InstaWhat?
//
//  Created by Steve Sneller on 8/25/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "IWASingleFilterViewController.h"

#import <Parse/Parse.h>

@interface IWASingleFilterViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate>

@end

@implementation IWASingleFilterViewController
{
    UITextView * postTextView;
    UIImageView * imageView1;
    UIView * minorView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        UIView * masterView = [[ UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024)];
 //       UIView * masterView = [[ UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        masterView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:masterView];
        
        imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 60, 728, 620)];
 //       UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-20, SCREEN_HEIGHT / 2)];
        imageView1.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:imageView1];
        
        minorView = [[ UIView alloc] initWithFrame:CGRectMake(20, 700, 728, 304)];
//        UIView * minorView = [[ UIView alloc] initWithFrame:CGRectMake(20, (SCREEN_HEIGHT / 2) + 20, SCREEN_WIDTH -40, (SCREEN_HEIGHT / 2) - 20)];
        minorView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:minorView];
        
        
        postTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, 688, 200)];
//        UITextField * postTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, (SCREEN_HEIGHT / 2) + 40, SCREEN_WIDTH - 80, (SCREEN_HEIGHT / 2) - 50)];
        postTextView.delegate = self;
        postTextView.backgroundColor = [UIColor whiteColor];
        [minorView addSubview:postTextView];
     //   [self.view addSubview:postTextView];
        
        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 220, 688, 70)];
 //       UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(40, (SCREEN_HEIGHT / 2) - 50, SCREEN_WIDTH -80, (SCREEN_HEIGHT / 2) - 20)];
        submitButton.backgroundColor = [UIColor orangeColor];
        [submitButton setTitle:@"SUBMIT" forState:UIControlStateNormal];
        [submitButton addTarget:self action:@selector(submitPost) forControlEvents:UIControlEventTouchUpInside];
        
        
        [minorView addSubview:submitButton];
     //   [self.view addSubview:submitButton];
    }
    return self;
}


-(void) submitPost
{
    NSString * postInfo = [[NSString alloc]init];
        postInfo = postTextView.text;
        NSLog(@"%@", postInfo);
        postTextView.text = @"";
        [postTextView resignFirstResponder];
    
    PFObject * face = [PFObject objectWithClassName:@"Faces"];
    
    [face setObject:postTextView.text forKey:@"text"];
    
    NSData * data = UIImagePNGRepresentation(imageView1.image);
    
    PFFile * file = [PFFile fileWithData:data];
    [face setObject:file forKey:@"image"];
    [face saveInBackground];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.2 animations:^{
        minorView.center = CGPointMake(minorView.center.x, minorView.center.y -100);
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)setFilteredImage:(UIImage *)filteredImage
{
    _filteredImage = filteredImage;
    imageView1.image = filteredImage;
}

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
