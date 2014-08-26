//
//  MAZModelController.h
//  PagedMaze
//
//  Created by Steve Sneller on 8/18/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MAZDataViewController;

@interface MAZModelController : NSObject <UIPageViewControllerDataSource>

- (MAZDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(MAZDataViewController *)viewController;

@end
