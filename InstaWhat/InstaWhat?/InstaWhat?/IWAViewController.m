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



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    photos = [@[] mutableCopy];
    
    imagePicker =[[UIImagePickerController alloc]init];
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    imagePicker.view.frame = self.view.frame;
    
    imagePicker.showsCameraControls = NO;
    
    imagePicker.delegate = self;
    
    imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    
    [self.view addSubview:imagePicker.view];
    
    [self addChildViewController:imagePicker];
    
    imagePicker.view.frame = CGRectMake(0, 0, 320, 320);
    


    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(100, 100);
    
    
    
    UICollectionView * photoCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 320, 320, [UIScreen mainScreen].bounds.size.height -320) collectionViewLayout:layout];
    
    photoCollection.dataSource = self;
    photoCollection.delegate = self;
    
    [photoCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:photoCollection];
    
    library = [[ALAssetsLibrary alloc]init];
    
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
    
    UIButton * takePictureButton = [[UIButton alloc]initWithFrame:CGRectMake(300, 370, 100, 100)];
    
    takePictureButton.backgroundColor = [UIColor blackColor];
    [takePictureButton addTarget:self action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:takePictureButton];
    
}

-(void)takePicture
{
    [imagePicker takePicture];
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UIImageView * bigView =[[UIImageView alloc]initWithFrame:imagePicker.view.frame];
    
    ALAsset * photo = photos[indexPath.item];
    
    ALAssetRepresentation * representation = photo.defaultRepresentation;
    
//    bigView.image = [UIImage imageWithCGImage:representation.fullResolutionImage];
//    
//    [self.view addSubview:bigView];
    
    // //  push viewcontroller
    
    [self showFilterWithImage:[UIImage imageWithCGImage:representation.fullResolutionImage]];
    
    NSLog(@"HERE IT IS");
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return photos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    ALAsset * photo = photos[indexPath.item];
    
    UIImageView * thumbnailView = [[UIImageView alloc]initWithFrame:cell.bounds];
    
    thumbnailView.image = [UIImage imageWithCGImage:photo.thumbnail];
    [cell.contentView addSubview:thumbnailView];
    
    return cell;
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    
//    
    imageView.image = info[UIImagePickerControllerOriginalImage];
//    
    [self.view addSubview:imageView];
    
    // //  push viewcontroller
}




- (void)showFilterWithImage:(UIImage *) image
{
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
