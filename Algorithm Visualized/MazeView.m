//
//  MazeView.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/9/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "MazeView.h"
#import "MazeBuildViewController.h"
#import "MazeCell.h"

@implementation MazeView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	// check for valid grid
	if ( [self maze] == nil ) {
		return;
	}
	float cellWidth = rect.size.width  / self.mazeWidth;
	float cellHeight = rect.size.height  / self.mazeHeight;

	// grab context
	CGContextRef context = UIGraphicsGetCurrentContext();

	// make the background black
	CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
	CGContextFillRect(context, rect);

	CGRect cellRect = CGRectMake(0, 0, cellWidth, cellHeight);
	
	MazeCell* current = nil;
	NSMutableArray* pathCells = [NSMutableArray arrayWithCapacity:[[self maze] count]/2];
	NSMutableArray* backPathCells = [NSMutableArray arrayWithCapacity:[[self maze] count]/2];
	
	// Iterate through each row, and sort cells into render groups
	for (int x = 0; x < self.mazeWidth; x++) {
//		cellRect.origin.x = x * cellWidth;
		
		// Iterate through each column
		for (int y = 0; y < self.mazeHeight; y++ ) {
//			cellRect.origin.y = y * cellHeight;
			MazeCell* cell = [self maze][x][y];
			if ( [cell isWall] ) {
				continue;
			}
			if ( [cell isCurrent]) {
				current = cell;
//				CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
			} else if ([cell isBacktraced] ) {
				[backPathCells addObject:cell];
//				CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
			} else {
				[pathCells addObject:cell];
//				CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
			}
		
			// Make a rect for each cell
//			CGContextFillRect(context, cellRect);
		}
	}
	
	// render the current cell
	cellRect.origin.x = current.x * cellWidth;
	cellRect.origin.y = current.y * cellHeight;
	CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
	CGContextFillRect(context, cellRect);
	
	// render the path cells
	CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
	for (MazeCell * cell in pathCells ) {
		cellRect.origin.x = cell.x * cellWidth;
		cellRect.origin.y = cell.y * cellHeight;
		CGContextAddRect(context, cellRect);
	}
	CGContextFillPath(context);

	// render the back path cells
	CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
	for (MazeCell * cell in backPathCells ) {
		cellRect.origin.x = cell.x * cellWidth;
		cellRect.origin.y = cell.y * cellHeight;
		CGContextAddRect(context, cellRect);
	}
	CGContextFillPath(context);
	
	
}

@end
