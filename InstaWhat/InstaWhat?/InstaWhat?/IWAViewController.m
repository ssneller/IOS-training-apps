//
//  IWAViewController.m
//  InstaWhat?
//
//  Created by Steve Sneller on 8/21/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "IWAViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "IWAFilterViewController.h"
#import "IWASingleFilterViewController.h"

@interface IWAViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation IWAViewController
{
    UIImagePickerController * imagePicker;
    NSMutableArray * photos;
    ALAssetsLibrary * library;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                  message:@"Device has no camera"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            [myAlertView show];
        }
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        
    photos = [@[] mutableCopy]; // // setup new array
    // // setting up the imagepicker
    imagePicker =[[UIImagePickerController alloc]init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.view.frame = CGRectMake(0, 0, 640, 480); // //self.view.frame;
    imagePicker.showsCameraControls = YES; // // puts camera button good for ipad
    imagePicker.delegate = self; // // REALLY need this for image capture
    imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;// // facing camera for selfie
    [self.view addSubview:imagePicker.view];
    [self addChildViewController:imagePicker];// // makes the camera a subview
    
    imagePicker.view.frame = CGRectMake(0, 0, 640, 480); // // 320x320 for iphone
    

    // // this presents the "gallery" of photos
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 100);// // 100x100 for iphone
    
    UICollectionView * photoCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(5, 600, 660, [UIScreen mainScreen].bounds.size.height -424) collectionViewLayout:layout]; // // 0, 320, 320, [UIScreen mainScreen].bounds.size.height -320 for iphone
    photoCollection.dataSource = self;// // datasource is to be retained on self as delegate
    photoCollection.delegate = self;// // need delegate for saving data
    [photoCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"]; // // register class for cells
    [self.view addSubview:photoCollection];
    
    
    library = [[ALAssetsLibrary alloc]init]; // // gets photos for above collection
    [library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop)
    {
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop)
        {
            NSLog(@"type %@", [result valueForProperty:ALAssetPropertyType]);
            if (result) [photos addObject:result];
            [photoCollection reloadData];
            
        }];
    } failureBlock:^(NSError *error) {
        
    }];

    
//    UIButton * takePictureButton = [[UIButton alloc]initWithFrame:CGRectMake(300, 370, 100, 100)]; // // removed for ipad
//    
//    takePictureButton.backgroundColor = [UIColor blackColor];
//    [takePictureButton addTarget:self action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:takePictureButton];
//    
}

//-(void)takePicture
//{
//    [imagePicker takePicture];
//}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ALAsset * photo = photos[indexPath.item];
    ALAssetRepresentation * representation = photo.defaultRepresentation;
    [self showFilterWithImage:[UIImage imageWithCGImage:representation.fullResolutionImage]];
//    NSLog(@"collection test");
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return photos.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{       // // setup cells for thumbnails for array
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    ALAsset * photo = photos[indexPath.item];
    UIImageView * thumbnailView = [[UIImageView alloc]initWithFrame:cell.bounds];
    thumbnailView.image = [UIImage imageWithCGImage:photo.thumbnail];
    [cell.contentView addSubview:thumbnailView];
    return cell;
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{       // // sets up dictionary for photos
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = info[UIImagePickerControllerOriginalImage];
    [self.view addSubview:imageView];
}


- (void)showFilterWithImage:(UIImage *) image
{       // // calls next VC after choosing image
    IWAFilterViewController * filterVC = [[IWAFilterViewController alloc]init];
    filterVC.originalImage = image;
    [self.navigationController pushViewController:filterVC animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
    
