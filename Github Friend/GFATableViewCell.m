//
//  GFATableViewCell.m
//  Github Friend
//
//  Created by Rene Candelier on 7/24/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "GFATableViewCell.h"
#import <QuartzCore/QuartzCore.h>
@implementation GFATableViewCell{
    
    UIImageView * friendImage;
   
    
    UILabel * friendName;
    UILabel * cityAndStateLabel;
    UILabel * followersLabel;
    UILabel * followingLabel;
    
    UIButton * searchButton;
    UIButton * gistsButton;
    UIButton * profileButton;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        //Setting the Name
        friendName = [[UILabel alloc]initWithFrame:CGRectMake(70, 0, 210, 50)];
        
        
        //Setting the City & State
        cityAndStateLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 10, 200, 90)];
        
        
        //Setting the Followers and Following labels.
        followersLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 9, 130, 150)];
        followingLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 130, 190)];
        
        //Setting the buttons for Gists and Profile
        profileButton = [[UIButton alloc]initWithFrame:CGRectMake(220, 50, 90, 30)];
        gistsButton = [[UIButton alloc]initWithFrame:CGRectMake(220, 85, 90, 30)];
        
        profileButton.layer.cornerRadius = 15;
        gistsButton.layer.cornerRadius = 15;
        
       //Setting the image
        friendImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15]];
        
        [gistsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [gistsButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15]];
        
        profileButton.backgroundColor = [UIColor colorWithRed:0.769f green:0.769f blue:0.769f alpha:1.0f];
        gistsButton.backgroundColor = [UIColor colorWithRed:0.769f green:0.769f blue:0.769f alpha:1.0f];
        
        
        
        cityAndStateLabel.textColor = [UIColor grayColor];
        cityAndStateLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 18.0];
        
        //Buttons
        [profileButton setTitle:@"PROFILE" forState:UIControlStateNormal];
        [gistsButton setTitle:@"GISTS" forState:UIControlStateNormal];


        //Inserting to the subview
        
        //Labels
        [self.contentView addSubview:friendName];
        [self.contentView addSubview:cityAndStateLabel];
        [self.contentView addSubview:followersLabel];
        [self.contentView addSubview:followingLabel];
        
        //Buttons
        [self.contentView addSubview:profileButton];
        [self.contentView addSubview:gistsButton];
        
        //Image
        [self.contentView addSubview:friendImage];
        
        //Fonts & Colors
        
        followingLabel.textColor = [UIColor colorWithRed:0.769f green:0.769f blue:0.769f alpha:1.0f];
        followingLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 18.0];
        
        followersLabel.textColor = [UIColor colorWithRed:0.769f green:0.769f blue:0.769f alpha:1.0f];
        followersLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 18.0];
        
        friendName.textColor = [UIColor colorWithRed:0.337f green:0.337f blue:0.337f alpha:1.0f];
        friendName.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size: 33.0];

        cityAndStateLabel.textColor = [UIColor colorWithRed:0.482f green:0.482f blue:0.482f alpha:1.0f];
        
        //Setting the Image to be a circle
        friendImage.layer.borderWidth = 1.0f;
        friendImage.layer.cornerRadius = 20;
        friendImage.layer.masksToBounds = NO;
        friendImage.clipsToBounds = YES;
    }
    return self;
}

-(void) setFriendInfo:(NSDictionary *)friendInfo{
    _friendInfo = friendInfo;
    
    NSURL * url = [NSURL URLWithString:@"https://avatars.githubusercontent.com/u/1536630?"];
    
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData:data];
    
    //Label for Name
    
    friendImage.image = image;
    friendName.text =friendInfo[@"name"];
    
    
    // Label for City
    
  
    cityAndStateLabel.text =friendInfo[@"location"];
  
    
    //Label for followers
    
    followersLabel.text = [NSString stringWithFormat:@"Followers : %@", friendInfo[@"followers"]];
    
    //Label for following
    
    followingLabel.text = [NSString stringWithFormat:@"Following : %@", friendInfo[@"following"]];;
    
    
    
    
    
    
    
    
    NSLog(@"%@",friendInfo);
}
//@"login": "joalbright"
//@"name":@"Jo Albright"
//@"blog": @"jo2.co"
//@"location":@"Atlanta, GA"
//@"email":@"me@jo2.com"
//@"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?"




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
