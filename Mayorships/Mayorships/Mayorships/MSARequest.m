//
//  MSARequest.m
//  Mayorships
//
//  Created by Steve Sneller on 8/19/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MSARequest.h"
#import "MSAData.h"

#define API @"https://api.foursquare.com/v2/"
#define CLIENT_ID @"YCLG0Y12YAPUY1RGIWAYWVLZOUQNWXSUKRLMUBFVSL0V0S1L"
#define CLIENT_SECRET @"4XEIRARUMK40T2QW1TYMUA4ASUM1JEPJ250G1W4RCQW2JVSF"


@implementation MSARequest

//- (void)viewDidLoad
//{
//    
//}



/*
/////////////////////////////// Heidi singelton and arrays
-(void)findMayorshipsWithLocation:(CLLocation *)location;
//-(void)findMayorshipsWithLocation:(CLLocation *)location;
{
    NSArray * venues = [MSARequest findVenuesWithLocation:location];
    
    NSMutableArray * locationsWithNoMayors = [@[] mutableCopy];
    NSMutableArray * locationsWithMayors = [@[] mutableCopy];
    
    for (NSDictionary * venue in venues)
    {
        NSString * endpoint = [NSString stringWithFormat:@"venues/%@", venue[@"id"]];
        NSDictionary * venueInfo = [MSARequest foursquareRequestWithEndpoint:endpoint andParameters:@{}];
        
        NSDictionary * mayor = venueInfo[@"response"][@"venue"][@"mayor"];
        
    //    int mayorCount = [mayor[@"count"] intValue];
        
        if (!mayor[@"user"])
        {
            [locationsWithNoMayors addObject:venueInfo];
        } else {
            [locationsWithMayors addObject:venueInfo];
        }
    
    }

    [MSAData mainData].venuesWithoutMayors = [locationsWithNoMayors copy];
    [MSAData mainData].venuesWithMayors = [locationsWithMayors copy];
    
}
//////////////////// end
*/

+(void)findMayorshipsWithLocation:(CLLocation *)location  completion:(void (^)(NSArray *mayors))completion
{
    NSArray * venues = [MSARequest findVenuesWithLocation:location];
    
    NSMutableArray * mayors = [@[] mutableCopy];
    
    for (NSDictionary * venue in venues)
    {
        NSString * endpoint = [NSString stringWithFormat:@"venues/%@", venue[@"id"]];
        NSDictionary * venueInfo = [MSARequest foursquareRequestWithEndpoint:endpoint andParameters:@{}];
        
        NSDictionary * mayor = venueInfo[@"response"][@"venue"][@"mayor"];
        
        if (mayor) {
            [mayors addObject:mayor];
        }
      //  [mayors addObject:mayor];
        
    }
   // return mayors;
}



// // array of dictionairies for coordinates
+(NSArray *)findVenuesWithLocation:(CLLocation *)location;
{
    NSDictionary * parameters = @{
                                  @"ll" : [NSString stringWithFormat:@"%f,%f", location.coordinate.latitude, location.coordinate.longitude]
                                  };
    return [MSARequest foursquareRequestWithEndpoint:@"venues/search" andParameters:parameters][@"response"][@"venues"];
}


+ (NSDictionary *)foursquareRequestWithEndpoint:(NSString *)endpoint andParameters:(NSDictionary *)parameters
{
    NSMutableString * requestString = [[API stringByAppendingString:endpoint] mutableCopy];
    
    // // make v custom to current day homework!!!
    
    NSDate *currentDate = [[NSDate alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSString *localDateString = [dateFormatter stringFromDate:currentDate];
    
    [requestString appendString:[NSString stringWithFormat:@"?client_id=%@&client_secret=%@&v=%@", CLIENT_ID, CLIENT_SECRET,localDateString]];
    
    for (NSString* key in [parameters allKeys])
    {
            [requestString appendFormat:@"&%@=%@", key, [parameters objectForKey:key]];
    }
    
//    NSLog(@"%@", requestString);
    
    NSURL * requestURL = [NSURL URLWithString:requestString];
    NSURLRequest * request = [NSURLRequest requestWithURL:requestURL];
    
    // when we hit the web server, we get back unfriendly data
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // turn the 'gibberish' into human friendly (i.e. JSON) format
    NSDictionary * responseInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    
    NSLog(@"%@", responseInfo[@"response"][@"venues"]);
    
    NSLog(@"%@", responseInfo[@"response"][@"venue"][@"mayor"][@"user"][@"photo"][@"prefix"]);
    
    NSLog(@"%@", responseInfo[@"response"][@"venue"][@"mayor"][@"user"][@"photo"][@"suffix"]);
    
    return responseInfo;

}



@end
