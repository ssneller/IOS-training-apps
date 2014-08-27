//
//  MSAFirstViewController.m
//  Mayorships
//
//  Created by Steve Sneller on 8/19/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MSAFirstViewController.h"
#import "MSARequest.h"
#import "MSAData.h"
#import <CoreLocation/CoreLocation.h>

@interface MSAFirstViewController () <UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>

@end

@implementation MSAFirstViewController
{
    NSArray * mayorships;
    CLLocationManager * locationManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    self.mayorList.dataSource = self;
    self.mayorList.delegate = self;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation * location = locations[0];
    [locationManager stopUpdatingLocation];
    
    [MSARequest findMayorshipsWithLocation:location completion:(void(^)(NSArray * mayors)) completion];
    [self.mayorList reloadData];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mayorships.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self.mayorList dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary * mayor = mayorships[indexPath.row];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        
        NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@100x100%@", mayor[@"user"][@"photo"][@"prefix"], mayor[@"user"][@"photo"][@"suffix"]]];
        
//        NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"https://irs2.4sqi.net/img/user/100x100%@", mayor[@"user"][@"photo"][@"suffix"]]];
        NSData * data = [NSData dataWithContentsOfURL:url];
        
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(200, 5, 30, 30)];
        button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithData:data]];
        [cell addSubview:button];
    }
    
        cell.textLabel.text = mayor[@"user"][@"firstName"];
    
    
    
 //   return cell;
}

@end
