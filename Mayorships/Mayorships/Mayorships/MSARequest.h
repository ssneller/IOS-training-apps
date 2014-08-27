//
//  MSARequest.h
//  Mayorships
//
//  Created by Steve Sneller on 8/19/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

@interface MSARequest : NSObject

+ (void)findMayorshipsWithLocation:(CLLocation *)location completion:(void(^)(NSArray * mayors)) completion;
//+ (void)findMayorshipsWithLocation:(CLLocation *)location;
+ (NSArray *)findVenuesWithLocation:(CLLocation *)location;

@end
