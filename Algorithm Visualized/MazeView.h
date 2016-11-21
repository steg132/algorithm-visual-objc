//
//  MazeView.h
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/9/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MazeView : UIView
// @d array, column x row
@property (nonatomic, strong) NSArray* maze;
@property( nonatomic, assign) int mazeWidth;
@property (nonatomic, assign) int mazeHeight;
@end
