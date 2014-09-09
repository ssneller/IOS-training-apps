//
//  ViewController.m
//  NewRailsApp
//
//  Created by Steve Sneller on 9/2/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate * appD = [[UIApplication sharedApplication] delegate];
    
    
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Post" inManagedObjectContext:appD.managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"user = 'jo@theironyard.com'"];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor * sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"posted_at" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [appD.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"fetchedObjects");
        
        NSLog(@"fetched objects are %@", fetchedObjects);
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postNew:(UIButton *)sender {
    
    NSString * urlStartString = @"\"http://ancient-taiga-9634.herokuapp.com/posts?post%5Btitle%5D=\\'";
    NSString * titleFieldName = self.titleField.text;
    NSString * firstSpacer = @"\\'&post%5Bcontent%5D=\\'";
    NSString * contextFieldName = self.contextField.text;
    NSString * secondSpacer = @"\\'\"";
    NSArray *myStrings = [[NSArray alloc] initWithObjects:urlStartString, titleFieldName, firstSpacer, contextFieldName, secondSpacer, nil];
    NSString *joinedString = [myStrings componentsJoinedByString:@""];
    
    NSLog(@"%@", joinedString);

    NSURL * url = [NSURL URLWithString:joinedString];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest * mutableRequest = [NSMutableURLRequest requestWithURL:url];
    [mutableRequest setHTTPMethod:@"Post"];
    
    
 //   var request = NSMutableURLRequest(URL: NSURL(string: encodedString!))
    
//    request.setValue("zxcasdqwe", forHTTPHeaderField: "AUTH_TOKEN")
    
//    request.HTTPMethod = "POST"
    
// "http://ancient-taiga-9634.herokuapp.com/posts?post%5Btitle%5D=\'rat\'&post%5Bcontent%5D=\'tar\'")
    
// "http://ancient-taiga-9634.herokuapp.com/posts?post%5Btitle%5D=\'rat\'&post%5Bcontent%5D=\'tar\'")
}

- (IBAction)getMyPosts:(UIButton *)sender {
    
    NSString * urlString = [NSString stringWithFormat:@"http://ancient-taiga-9634.herokuapp.com/posts/mine/"];
    NSURL * url = [NSURL URLWithString:urlString];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest * mutableRequest = [NSMutableURLRequest requestWithURL:url];
    [mutableRequest setHTTPMethod:@"Post"];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary * posts = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    NSLog(@"%@", posts);
}

- (IBAction)getAllPosts:(UIButton *)sender {
    
    NSString * urlString = [NSString stringWithFormat:@"http://ancient-taiga-9634.herokuapp.com/posts/"];
    NSURL * url = [NSURL URLWithString:urlString];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest * mutableRequest = [NSMutableURLRequest requestWithURL:url];
    [mutableRequest setHTTPMethod:@"Post"];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary * posts = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    NSLog(@"%@", posts);
}
@end
