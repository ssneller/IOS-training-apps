//
//  MCSViewController.m
//  My Cool Spots
//
//  Created by Steve Sneller on 8/18/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MCSViewController.h"
#import <MapKit/MapKit.h>   // //  map kit
#import <CoreLocation/CoreLocation.h> // // location
#import "MCSAnnotation.h" // // annotation NSobject for map pins
#import "MCSFourSquareRequest.h"
#import "MCSTableViewController.h"



@interface MCSViewController () <CLLocationManagerDelegate, MKMapViewDelegate> // // notice both delegates

@end

@implementation MCSViewController
{
    MKMapView * myMapView;  // // global mapview
    CLLocationManager * locationManager; // // global location mgr
 //   UIWebView * webView;
    
}

//- (void)addChildViewController:(UIViewController *)MCSTableViewController
//{
//    
//}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    MCSTableViewController* tableViewController = [[MCSTableViewController alloc] init];
    tableViewController.tableView.frame = CGRectMake(0, 300, 320, 200);
    [self.view addSubview:tableViewController.tableView];
    [self addChildViewController:tableViewController];
    
//    myMapView = [[MKMapView alloc]initWithFrame:self.view.frame];   // // uses entire window frame
    myMapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];   // // uses entire window frame
    myMapView.showsUserLocation = YES;  // // shows current location
    myMapView.delegate = self;  // // allows talking both ways
  
    myMapView.userTrackingMode = YES;
    [self.view addSubview:myMapView];
    
  
    locationManager = [[CLLocationManager alloc]init];
    
    locationManager.delegate = self;    // // to "talk back up"
    
    [locationManager startUpdatingLocation]; // // does 1st location update
    
    
}







-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    for (CLLocation * location in locations) {
        NSLog(@"%f %f", location.coordinate.latitude, location.coordinate.longitude); // coordinates?
        
        // // call FourSquareRequest and create annotations for each venue
        // // add a TVC as a subview
        
        // // zoom into location
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
        
        [myMapView setRegion:region animated:YES];
        
        for (int i = 1; i < 5; i++)
        {
            MCSAnnotation * annotation = [[MCSAnnotation alloc] init];
            
            float randomLat = arc4random_uniform(100 - 50) /100.0 + location.coordinate.latitude;
            float randomLong = arc4random_uniform(100 - 50) /100.0 + location.coordinate.longitude;
            
            CLLocationCoordinate2D randomCoordinate = CLLocationCoordinate2DMake(randomLat, randomLong);
            [annotation setCoordinate:randomCoordinate];    // // random coordinates for map
            
            CLGeocoder* goecoder = [[CLGeocoder alloc]init];    // //  grabs placemark data about coordinates
            [goecoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
                for (CLPlacemark * placemark in placemarks)
                {
                    [annotation setTitle:placemark.addressDictionary[@"City"]];
                }
            }];
            
            [myMapView addAnnotation:annotation];   // // adds "pin and info"
        }
    }
    
    [locationManager stopUpdatingLocation];
    
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation // // to change map annotation
{
    MCSAnnotation * ann = annotation;   // // notice that both conditions ust be met
    if (mapView.userLocation.location.coordinate.latitude == ann.coordinate.latitude && mapView.userLocation.location.coordinate.longitude == ann.coordinate.longitude) {
        
    } else {
        MKPinAnnotationView * annotationView = [[ MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];
        
        annotationView.draggable = YES; // // allows dragging of pin
        
        NSArray * markers = @[                              // // array of pins
                              [UIImage imageNamed:@"blue"],
                              [UIImage imageNamed:@"green"],
                              [UIImage imageNamed:@"magenta"],
                              ];
        
        int randomMarker = arc4random_uniform((int)markers.count);
        annotationView.image = markers[randomMarker];
        
        annotationView.canShowCallout = YES;    // // displays callout
        UIButton * rightCallout = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightCallout addTarget:self action:@selector(showDetailVC) forControlEvents:UIControlEventTouchUpInside];  // // rightcallout displays more info than left
        annotationView.rightCalloutAccessoryView = rightCallout;
        
        return annotationView;
    }
    return nil;
}


- (void)showDetailVC    // // shows new VC to display "detailed" info
{
    UIViewController * detailVC = [[ UIViewController alloc]init];
    detailVC.view.backgroundColor = [UIColor grayColor];
    [self.navigationController pushViewController:detailVC animated:YES];
}

//- (void)showMCSTableViewController    // // shows new VC to display "detailed" info
//{
//    UIViewController * TVC = [[ UIViewController alloc]init];
//    TVC.view.frame = CGRectMake(0, 0, 200, 200);
//    TVC.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController pushViewController:TVC animated:YES];
//    [self.view addSubview:TVC];
//}

@end
