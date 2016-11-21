//
//  MazeBuildViewController.h
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/9/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MazeView.h"
#import "MazeCell.h"
#import "DetailViewController.h"


@interface MazeBuildViewController : DetailViewController
@property (nonatomic, strong) IBOutlet MazeView* mazeView;

@property (nonatomic, readonly) int mazeWidth;
@property (nonatomic, readonly) int mazeHeight;
@property (nonatomic, readonly) NSTimeInterval updateInterval;

// My Maze, Column x row
@property (nonatomic, strong) NSArray* maze;

// Override methods
-(void) iterate;
-(BOOL) isComplete;
@end
