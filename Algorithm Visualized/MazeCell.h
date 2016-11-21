//
//  MazeCell.h
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/9/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MazeCell : NSObject
@property (nonatomic, assign) int x;
@property (nonatomic, assign) int y;

@property (nonatomic, assign) BOOL isWall;
@property (nonatomic, assign) BOOL isBacktraced;
@property (nonatomic, assign) BOOL isCurrent;

+(id) cellWithPositionX: (float) x Y: (int) y;
@end
