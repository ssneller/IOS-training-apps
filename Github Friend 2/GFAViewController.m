//
//  GFAViewController.m
//  Github Friend
//
//  Created by Steve Sneller on 7/25/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "GFAViewController.h"

@interface GFAViewController ()

@end

@implementation GFAViewController
{
    UIWebView * webView;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    webView = [[UIWebView alloc] initWithFrame:self.view.frame]; /// uses entire view size
    
    [self.view addSubview:webView];/// add so it is visible
}

-(void)setFriendInfo:(NSDictionary *)friendInfo
{
    _friendInfo = friendInfo;
    
    NSURL * url = [NSURL URLWithString:friendInfo[@"html_url"]]; /// these 3 lines give URL and request it
 ///   NSLog(@"WTF?");
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
