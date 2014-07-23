//
//  SS_CrystalBall.h
//  Crystal Ball
//
//  Created by Steve Sneller on 7/18/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SS_CrystalBall : NSObject {
    NSArray *_predictions;
}

@property (strong, nonatomic, readonly) NSArray *predictions;

- (NSString*) randomPrediction;

@end
