//
//  MSAData.m
//  Mayorships
//
//  Created by Steve Sneller on 8/19/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MSAData.h"

@implementation MSAData

{
    NSArray * levels;
    //  NSArray * highScores;
}


+ (MSAData *)mainData      // //
{
    static dispatch_once_t create;
    static MSAData * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[MSAData alloc]init];  // // instance method that is called once
        
    });
    return singleton;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        self.venuesWithMayors = @[];
        self.venuesWithoutMayors = @[];
    }
    return self;
}



@end
