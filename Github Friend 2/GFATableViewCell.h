//
//  GFATableViewCell.h
//  Github Friend
//
//  Created by Steve Sneller on 7/24/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFATableViewCell : UITableViewCell////UITableViewCell
@property (nonatomic) int xValue;
@property (nonatomic) UINavigationController * navigationController;

@property (nonatomic) NSDictionary * friendInfo;
@end
