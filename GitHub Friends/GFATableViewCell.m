//
//  GFATableViewCell.m
//  GitHub Friends
//
//  Created by Steve Sneller on 7/24/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "GFATableViewCell.h"

@implementation GFATableViewCell
{
    UILabel * friendName; ///put it here to make it global
    
    UIImageView * friendImage;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // Initialization code
        
        friendName = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 200, 40)]; ///placed it here so it clears name from cell before reuse
        
        [self.contentView addSubview:friendName];
        
        friendImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        
    }
    return self;
}


/*
@"login": @"ssneller",
@"name": @"Steve",
@"avatar_url": @"https://avatars0.githubusercontent.com/u/8129918?s=460"
@"blog": @"SS.co",
@"location": @"Atl",
@"email": @"ss@.ss.com,
*/

-(void) setFriendInfo:(NSDictionary *)friendInfo   /// setter method for friendInfo
{
    _friendInfo = friendInfo;
/*
    UILabel * friendName = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];  /// moved to 
    
    [self.contentView addSubview:friendName];
*/
   /// for image getting
    NSURL * url = [NSURL URLWithString:friendInfo[@"avatar_url"]];
    NSData * data = [NSData dataWithContentsOfURL:url];
    UIImage * image = [UIImage imageWithData:data];
    friendImage.image = image;
    
    friendName.text = friendInfo[@"name"];
    
    NSLog(@"%@", friendInfo);
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
