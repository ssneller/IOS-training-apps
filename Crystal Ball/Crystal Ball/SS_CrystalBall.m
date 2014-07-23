//
//  SS_CrystalBall.m
//  Crystal Ball
//
//  Created by Steve Sneller on 7/18/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "SS_CrystalBall.h"

@implementation SS_CrystalBall


- (NSArray*) predictions {
    if (_predictions== nil) {
        _predictions = [[NSArray alloc] initWithObjects:@"It is certain", @"probably", @"Stars are not aligned", @"No", @"Probably Not", @"I just don't know", @"Hell No!!!", nil];
    }
    return _predictions;
}

- (NSString*) randomPrediction {
   int random = arc4random_uniform(6); // self.predictions.count doesn't work here
 //   int random = arc4random_uniform(self.predictions.count);
    return [self.predictions objectAtIndex:random];
}

@end
