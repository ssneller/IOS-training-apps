//
//  MCSTableViewCell.m
//  My Cool Spots
//
//  Created by Steve Sneller on 8/18/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import "MCSTableViewCell.h"

@implementation MCSTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
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
