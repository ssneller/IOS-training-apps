//
//  MCSAnnotation.h
//  My Cool Spots
//
//  Created by Steve Sneller on 8/18/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

@interface MCSAnnotation : NSObject <MKAnnotation>

@property ( nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString * title; // // title for "pin data"

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;    //  // must be implemented for the readonly

-(void)setTitle:(NSString *)title;  // // needed for annotation data

@end
