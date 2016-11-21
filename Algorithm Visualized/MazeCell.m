//
//  MazeCell.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/9/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "MazeCell.h"

@implementation MazeCell

-(id) init {
	if ((self = [super init])) {
		[self setIsCurrent:false];
		[self setIsWall:true];
		[self setIsBacktraced:false];
	}
	return self;
}

-(id) initWithPositionX: (float) x Y: (int) y  {
	self = [self init];
	[self setX:x];
	[self setY:y];
	return self;
}

+(id) cellWithPositionX: (float) x Y: (int) y {
	return [[MazeCell alloc] initWithPositionX:x Y:y];
}
@end
