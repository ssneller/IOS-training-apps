//
//  GRAGitHubRequest.m
//  GitHubRequest
//
//  Created by Steve Sneller on 7/28/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

//// this request creates a method

#import "GRAGitHubRequest.h"

@implementation GRAGitHubRequest

+ (NSDictionary *)requestUserInfo:(NSString *)username   /// method name and username is parameter passed
{
    ///take the username and call the github url
    
    NSString * urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@?access_token=49c49db2d6ab1cb078190a672ce00e1d36013327", username];
    
    NSURL * url = [NSURL URLWithString:urlString]; /// makes it readable to program
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url]; /// set variable for request
    
    /// mutable request
    
    ///    NSMutableURLRequest * mutableRequest = [NSMutableURLRequest requestWithURL:url];
    
    ///    [mutableRequest setHTTPMethod:@"POST"];
    
    
    ///   mutableRequest.HTTPMethod = @"POST";   /// setting and getting properties
    
    //////
    
    NSURLResponse * response = nil;   /// running method on nil keeps it from crashing
    
    NSError * error = nil;  /// running method on nil keeps it from crashing
    
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];   /// use synch  , put & infront of variables
    
    NSDictionary * userInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];   /// dictionary using NSJSONSerialization is standard for this website
    
    
    NSLog(@"user info = %@", userInfo);   /// print the data to console
    
    return  userInfo;  ///returns data
}


/// new method to get the dictionaries
+ (void) saveUsers: (NSArray *)users
{
    /// path to what we re saving
    NSString * path = [GRAGitHubRequest usersArchivePath];   ///returns path
    
    /// then we archive
    NSData * userData = [NSKeyedArchiver archivedDataWithRootObject:users];
    
    ///then save file
    [userData writeToFile:path options:NSDataWritingAtomic error:nil];
}

/// new method to load the data and pull it apart
+ (NSArray *)loadUsers
{
    /// path to what we are loading
    NSString * path = [GRAGitHubRequest usersArchivePath];   ///returns path
    /// then we unarchive
    NSArray * users = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    /// then we return the array
    return users;
}

/// new method
+ (NSString *)usersArchivePath
{
    /// returns the path for above methods
    ///returns array of directories
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * documentDirectory = documentDirectories[0];
    
    return  [documentDirectory stringByAppendingPathComponent:@"users.data"];
    
}


@end
