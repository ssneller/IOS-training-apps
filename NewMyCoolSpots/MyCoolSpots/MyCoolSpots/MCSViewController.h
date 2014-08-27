//
//  MCSViewController.h
//  MyCoolSpots
//
//  Created by Steve Sneller on 8/18/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MCSViewController : UIViewController <MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;


- (IBAction)zoomIn:(id)sender;
- (IBAction)changeMapType:(id)sender;

@end
