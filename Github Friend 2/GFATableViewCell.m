//
//  GFATableViewCell.m
//  Github Friend
//
//  Created by Steve Sneller on 7/24/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//


#import "GFATableViewController.h"
#import "GFAViewController.h"

#import "GFATableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface GFATableViewController ()  <UITextFieldDelegate>

@end
@implementation GFATableViewCell
{
    
    UIImageView * leadOrFollowImage;
    UIImageView * friendImage;
    UIImageView * statusImage;
    
    UIImage * profileButtonImage;
    UIImage * arrowDownImage;
    UIImage * arrowUpImage;
    
    UILabel * friendName;
    UILabel * cityAndStateLabel;
    UILabel * followersLabel;
    UILabel * followingLabel;
    UILabel * followStatusLabel;
    UILabel * gistsNumberLabel;
    UILabel * followNumberLabel;
    UILabel * leadOrFollowLabel;
    
    UIButton * searchButton;
    UIButton * gistsButton;
    UIButton * profileButton;
    UIWebView  * webView1;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        //        int screenHeight = [UIScreen mainScreen].bounds.size.height; ///this indicates the boundary of the screen
        //        int screenWidth = [UIScreen mainScreen].bounds.size.width;    /// we use this as a method to scale the login button location at the bottom
        
        int cellHeight = 100;
        int cellWidth = [UIScreen mainScreen].bounds.size.width;
        float buttonSize = 20;
        
        // set the cell background value
        self.contentView.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        
        //Setting the Name
        friendName = [[UILabel alloc]initWithFrame:CGRectMake(cellWidth * .4, 0, 210, 50)];
        //        friendName.textColor = [UIColor colorWithRed:0.337f green:0.337f blue:0.337f alpha:1.0f];
        friendName.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size: 22.0];
        friendName.textColor = [UIColor whiteColor];
        [self.contentView addSubview:friendName];
        
        //setting the profile arrow Up and down button images
        profileButtonImage = [UIImage imageNamed:@"profileArrow.png"];
        arrowDownImage = [UIImage imageNamed:@"downArrow.png"];
        arrowUpImage = [UIImage imageNamed:@"upArrow.png"];
        
        //Setting the Number of Gists
        gistsNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(cellWidth * .75, cellHeight * .7, buttonSize, buttonSize)];
        gistsNumberLabel.textColor = [UIColor blackColor];
        gistsNumberLabel.font = [UIFont fontWithName:@"Courier" size: 14.0];
        gistsNumberLabel.backgroundColor = [UIColor whiteColor];
        gistsNumberLabel.layer.borderWidth = 1.0f;
        gistsNumberLabel.layer.cornerRadius = buttonSize/2;
        gistsNumberLabel.layer.masksToBounds = NO;
        gistsNumberLabel.clipsToBounds = YES;
        gistsNumberLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:gistsNumberLabel];
        
        
        //Setting the Number of follow difference
        followNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(cellWidth * .4, cellHeight * .7, buttonSize, buttonSize)];
        followNumberLabel.textColor = [UIColor colorWithRed:0.498f green:0.498f blue:0.498f alpha:1.0f];
        followNumberLabel.font = [UIFont fontWithName:@"Courier" size: 14.0];
        followNumberLabel.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        followNumberLabel.layer.borderWidth = 1.0f;
        followNumberLabel.layer.borderColor = [UIColor colorWithRed:0.498f green:0.498f blue:0.498f alpha:1.0f].CGColor;
        followNumberLabel.layer.cornerRadius = buttonSize/2;
        followNumberLabel.layer.masksToBounds = NO;
        followNumberLabel.clipsToBounds = YES;
        followNumberLabel.text = @"0";
        followNumberLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:followNumberLabel];
        
        //Setting the status and number
        leadOrFollowLabel = [[UILabel alloc]initWithFrame:CGRectMake(cellWidth * .35, cellHeight * .7, buttonSize, buttonSize)];
        leadOrFollowLabel.textColor = [UIColor blackColor];
        leadOrFollowLabel.font = [UIFont fontWithName:@"Courier" size: 14.0];
        leadOrFollowLabel.backgroundColor = [UIColor colorWithRed:0.498f green:0.498f blue:0.498f alpha:1.0f];   ///[UIColor whiteColor];///
        leadOrFollowLabel.layer.borderWidth = 1.0f;
        leadOrFollowLabel.layer.cornerRadius = buttonSize/2;
        leadOrFollowLabel.layer.masksToBounds = NO;
        leadOrFollowLabel.clipsToBounds = YES;
        leadOrFollowLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:leadOrFollowLabel];
        
        //Setting the status image
        statusImage = [[UIImageView alloc]initWithFrame:CGRectMake(cellWidth * .35, cellHeight * .7, buttonSize, buttonSize)];
        [self.contentView addSubview:statusImage];
        
        //Setting the follow status image
        leadOrFollowImage = [[UIImageView alloc]initWithFrame:CGRectMake(cellWidth * .47, cellHeight * .7, 90, buttonSize)];
        [self.contentView addSubview:leadOrFollowImage];
        
        
        //Setting the status number
        followStatusLabel = [[UILabel alloc]initWithFrame:CGRectMake(cellWidth * .47, cellHeight * .7, 90, buttonSize)];
        followStatusLabel.textColor = [UIColor colorWithRed:0.498f green:0.498f blue:0.498f alpha:1.0f];
        followStatusLabel.font = [UIFont fontWithName:@"Courier" size: 11.0];
        followStatusLabel.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        //      followStatusLabel.layer.borderWidth = 1.0f;
        //      followStatusLabel.layer.cornerRadius = 10;
        followStatusLabel.text = (@"Just Friends");
        followStatusLabel.layer.masksToBounds = NO;
        followStatusLabel.clipsToBounds = YES;
        [self.contentView addSubview:followStatusLabel];
        
        //Setting the City & State
        cityAndStateLabel = [[UILabel alloc]initWithFrame:CGRectMake(cellWidth * .4, 10, 200, 90)];
        cityAndStateLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 14.0];
        cityAndStateLabel.textColor = [UIColor colorWithRed:0.482f green:0.482f blue:0.482f alpha:1.0f];
        [self.contentView addSubview:cityAndStateLabel];
        
        //Setting the Followers labels. /// not used here
        followersLabel = [[UILabel alloc]initWithFrame:CGRectMake(cellWidth * 4, 9, 130, 150)];
        //       followersLabel.textColor = [UIColor colorWithRed:0.769f green:0.769f blue:0.769f alpha:1.0f];
        followersLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 14.0];
        followersLabel.textColor = [UIColor whiteColor];
        //        [self.contentView addSubview:followersLabel];
        
        //Setting the Following labels. /// not used here
        followingLabel = [[UILabel alloc]initWithFrame:CGRectMake(cellWidth * .4, 10, 130, 190)];
        //        followingLabel.textColor = [UIColor colorWithRed:0.769f green:0.769f blue:0.769f alpha:1.0f];
        followingLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 14.0];
        followingLabel.textColor = [UIColor whiteColor];
        //        [self.contentView addSubview:followingLabel];
        
        
        //Setting the buttons for Profile
        profileButton = [[UIButton alloc]initWithFrame:CGRectMake(cellWidth * .9, cellHeight * .15, buttonSize, buttonSize)];
        profileButton.layer.cornerRadius = buttonSize/2;
        profileButton.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        profileButton.layer.borderWidth = 1;
        profileButton.layer.borderColor = [UIColor whiteColor].CGColor;
        [profileButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15]];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton addTarget:self action:@selector(profileButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [profileButton setTitle:@"" forState:UIControlStateNormal];
        [profileButton setImage:profileButtonImage forState:UIControlStateNormal];
        [self.contentView addSubview:profileButton];
        
        //Setting the buttons for Gists
        gistsButton = [[UIButton alloc]initWithFrame:CGRectMake(cellWidth * .8, cellHeight * .7, 50, buttonSize)];
        gistsButton.layer.cornerRadius = buttonSize/2;
        gistsButton.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        gistsButton.layer.borderWidth = 1;
        gistsButton.layer.borderColor = [UIColor whiteColor].CGColor;
        [gistsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [gistsButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:12]];
        [gistsButton addTarget:self action:@selector(gistsButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [gistsButton setTitle:@"GISTS" forState:UIControlStateNormal];
        [self.contentView addSubview:gistsButton];
        
        //Setting the friend image
        friendImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cellHeight, cellHeight)];   ///statusImage
        [self.contentView addSubview:friendImage];
        
    }
    return self;
}

-(void) profileButtonClicked
{
    NSLog(@" Profile Button Clicked");
    
    GFAViewController * profileView = [[GFAViewController alloc]init];/// create
    
    profileView.view.backgroundColor =[UIColor lightGrayColor];/// be sure to add a background
    
    //    profileView.friendInfo = gitHubFriends[indexPath.row];
    profileView.friendInfo = self.friendInfo;
    
    [self.navigationController pushViewController:profileView animated:YES];
    
}


- (void)setXValue:(int)xValue
{
    _xValue = xValue;
    
    //    gistsNumberLabel.frame = CGRectMake(cellWidth * .75, xValue * .7, buttonSize, buttonSize);
    
}

-(void) gistsButtonClicked
{
    NSLog(@" Gists Button Clicked");
    GFAViewController * profileView = [[GFAViewController alloc]init];/// create
    
    profileView.view.backgroundColor =[UIColor lightGrayColor];/// be sure to add a background
    
    //    profileView.friendInfo = gitHubFriends[indexPath.row];
    
    NSString * gistURL = [NSString stringWithFormat:@"https://gist.github.com/%@", self.friendInfo[@"login"]];
    
    profileView.friendInfo = @{@"html_url":gistURL};   ///self.friendInfo;
    
    [self.navigationController pushViewController:profileView animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GFATableViewCell * cellH1 = [[GFATableViewCell alloc]init];
    
    cellH1.xValue = 100;
    
    NSLog(@"cellH1 is %i",cellH1.xValue);
    return cellH1.xValue;
}

/*
 
 @"login": @"joalbright",
 @"name":@"Jo Albright",
 @"public_gists": @"2",
 @"location":@"Atlanta, GA",
 @"email":@"me@jo2.com",
 @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
 @"html_url": @"https://github.com/joalbright",
 @"followers":@"20",
 @"following":@"22"
 
 */

-(void) setFriendInfo:(NSDictionary *)friendInfo
{
    _friendInfo = friendInfo;
    
    /// get avatar URL for picture
    NSString * avatarURL =[NSString stringWithFormat:@"%@" , friendInfo[@"avatar_url"]];
    //   NSLog(@"user avatar URL is %@", avatarURL);
    
    NSURL * avatarURLName = [NSURL URLWithString:avatarURL];
    
    NSData * data = [NSData dataWithContentsOfURL:avatarURLName];
    
    UIImage *image = [UIImage imageWithData:data];
    
    friendImage.image = image;
    
    /// get user URL
    
    NSString * userURL =[NSString stringWithFormat:@"%@" , friendInfo[@"html_url"]];
    NSLog(@"user URL is %@", userURL);
    
    //    NSURL * url = [NSURL URLWithString:userURL];
    
    //    NSData * userData = [NSData dataWithContentsOfURL:url];
    //    NSLog(@"user data is %@", userURL);
    
    // get Label data for for Name
    friendName.text =friendInfo[@"name"];
    
    // get Label for City and state
    cityAndStateLabel.text =friendInfo[@"location"];
    
    // Get Label data for # of gists
    
    //    gistsNumberLabel.text =[NSString stringWithFormat:@"%@" , friendInfo[@"public_gists"]];
    NSString * gists =[NSString stringWithFormat:@"%@" , friendInfo[@"public_gists"]];
    gistsNumberLabel.text = gists;
    
    // get data for followers
    //    followersLabel.text = [NSString stringWithFormat:@"Followers : %@", friendInfo[@"followers"]];
    followersLabel.text = [NSString stringWithFormat:@"%@", friendInfo[@"followers"]];
    
    //    NSLog(followersLabel.text);
    NSString *fers = followersLabel.text;
    int friendFollowers = [fers integerValue];
    
    //Label for following
    followingLabel.text = [NSString stringWithFormat:@"%@", friendInfo[@"following"]];;
    NSString *followString = followingLabel.text;
    //    NSLog(@"char is %@", followString);
    int friendFollowing = [followString integerValue];
    
    followNumberLabel.text = @"0";
    
    if (friendFollowers > friendFollowing) {
        //      NSLog(@"up");
        followStatusLabel.text = (@"Follower");
        followStatusLabel.textColor = [UIColor colorWithRed:0.965f green:0.125f blue:0.341f alpha:1.0f];
        followNumberLabel.layer.borderColor = [UIColor colorWithRed:0.965f green:0.125f blue:0.341f alpha:1.0f].CGColor;
        followNumberLabel.textColor = [UIColor colorWithRed:0.965f green:0.125f blue:0.341f alpha:1.0f];
        int fList = friendFollowers - friendFollowing;
        NSString *strFromInt = [NSString stringWithFormat:@"%d",fList];
        NSLog(@"%@",strFromInt);
        followNumberLabel.text = (strFromInt);
        [statusImage setImage:arrowDownImage];
    }
    if (friendFollowing > friendFollowers) {
        //      NSLog(@"down");
        followStatusLabel.text = (@"Leader");
        followStatusLabel.textColor = [UIColor colorWithRed:0.196f green:0.973f blue:0.749f alpha:1.0f];
        followNumberLabel.layer.borderColor = [UIColor colorWithRed:0.196f green:0.973f blue:0.749f alpha:1.0f].CGColor;
        followNumberLabel.textColor = [UIColor colorWithRed:0.196f green:0.973f blue:0.749f alpha:1.0f];
        int fList = friendFollowing - friendFollowers;
        NSString *strFromInt = [NSString stringWithFormat:@"%d",fList];
        NSLog(@"%@",strFromInt);
        followNumberLabel.text = (strFromInt);
        [statusImage setImage:arrowUpImage];
        
    }
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
