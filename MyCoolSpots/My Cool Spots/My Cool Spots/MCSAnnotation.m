//
//  MCSAnnotation.m
//  My Cool Spots
//
//  Created by Steve Sneller on 8/18/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MCSAnnotation.h"

@implementation MCSAnnotation

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;    //  // must be implemented for the readonly
{
    _coordinate = newCoordinate;    //  // for "pin"
}

-(void)setTitle:(NSString *)title;
{
    _title = title;
}


@end
