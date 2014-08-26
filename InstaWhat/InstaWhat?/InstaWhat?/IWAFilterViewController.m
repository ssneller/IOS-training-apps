//
//  IWAFilterViewController.m
//  InstaWhat?
//
//  Created by Steve Sneller on 8/25/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "IWAFilterViewController.h"
#import "IWASingleFilterViewController.h"

@interface IWAFilterViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation IWAFilterViewController

{
    UIImageView * imageView;
    
    UICollectionView * filterCollection;
    
    NSArray * filters;
    NSMutableDictionary * filteredImage;
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        filters = @[
//                    @"CIColorCrossPolynomial",
//                    @"CIColorCube",
//                    @"CIColorCubeWithColorSpace",
//                    @"CIColorInvert",
//                    @"CIColorMap",
//                    @"CIColorMonochrome",
//                    @"CIColorPosterize",
//                    @"CIFalseColor",
//                    @"CIMaskToAlpha",
//                    @"CIMaximumComponent",
//                    @"CIMinimumComponent",
//                    @"CIPhotoEffectChrome",
//                    @"CIPhotoEffectFade",
//                    @"CIPhotoEffectInstant",
//                    @"CIPhotoEffectMono",
//                    @"CIPhotoEffectNoir",
//                    @"CIPhotoEffectProcess",
                    @"CIPhotoEffectTonal",
                    @"CIPhotoEffectTransfer",
                    @"CISepiaTone",
                    @"CIVignette",
                    @"CIVignetteEffect"
                    ];
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.view addSubview:imageView];
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        
        layout.itemSize = CGSizeMake(100, 100);
        
        filterCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 320, 320, [UIScreen mainScreen].bounds.size.height -320) collectionViewLayout:layout];
        
        filterCollection.dataSource = self;
        filterCollection.delegate = self;
        
        [filterCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        [self.view addSubview:filterCollection];
        
        filteredImage = [@{} mutableCopy];
        
           
    }
    return self;
}


- (void)setOriginalImage:(UIImage *)originalImage
{
    _originalImage = originalImage;
    imageView.image = originalImage;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return filters.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString * filterName = filters[indexPath.item];
    
    UIImageView * filterView = [[ UIImageView alloc]initWithFrame:cell.bounds];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        UIImage * filterImage = [self filterImageWithFilterName:filterName];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            filterView.image = filterImage;
            
            [filteredImage setObject:filterImage forKey:[NSString stringWithFormat:@"%d", indexPath.item]];
            
        });
        
    });
    
    [cell addSubview:filterView];
    
    return  cell;
    
}


- (UIImage *)filterImageWithFilterName:(NSString *)filterName
{
    
    // turn UIImage into ciimage
    CIImage * ciImage = [CIImage imageWithCGImage:self.originalImage.CGImage];
    
    // create cifilter with filtername
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    // // add ciimage to filter
    [filter setValue:ciImage forKeyPath:kCIInputImageKey];
    
    // get filtered image
    CIImage * ciResult = [filter outputImage];
    
    //setup context to turn image into ciimage
    CIContext * ciContext = [CIContext contextWithOptions:nil];
    
    // init UIimage with cgiimage
    return  [UIImage imageWithCGImage:[ciContext createCGImage:ciResult fromRect:[ciResult extent]]];
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//        UIImageView * bigView =[[UIImageView alloc]initWithFrame:imagePicker.view.frame];
    
//    ALAsset * photo = photos[indexPath.item];
    
//    ALAssetRepresentation * representation = photo.defaultRepresentation;
    
//        bigView.image = [UIImage imageWithCGImage:representation.fullResolutionImage];
    //
    //    [self.view addSubview:bigView];
    
    // //  push viewcontroller
   
    [self showFilterWithImage:filteredImage[[NSString stringWithFormat:@"%d", indexPath.item]]];
    
//    [self showFilterWithImage:[UIImage imageWithCGImage:representation.fullResolutionImage]];
    
    NSLog(@"HERE IT IS 2");
}



- (void)showFilterWithImage:(UIImage *) image
{
    IWASingleFilterViewController * filteredVC1 = [[IWASingleFilterViewController alloc]init];
    
    filteredVC1.filteredImage = image;
    
    [self.navigationController pushViewController:filteredVC1 animated:YES];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
