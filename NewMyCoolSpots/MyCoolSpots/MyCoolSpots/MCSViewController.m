//
//  MCSViewController.m
//  MyCoolSpots
//
//  Created by Steve Sneller on 8/18/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MCSViewController.h"

@interface MCSViewController ()

@end

@implementation MCSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _mapView.showsUserLocation = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zoomIn:(id)sender {
    MKUserLocation *userLocation = _mapView.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        userLocation.location.coordinate, 20000, 20000);
    [_mapView setRegion:region animated:NO];
}

- (IBAction)changeMapType:(id)sender {
}


@end
