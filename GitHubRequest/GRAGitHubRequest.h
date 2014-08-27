//
//  GRAGitHubRequest.h
//  GitHubRequest
//
//  Created by Steve Sneller on 7/28/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRAGitHubRequest : NSObject

+ (NSDictionary *)requestUserInfo:(NSString *)username; //// this makes it a method

@end
