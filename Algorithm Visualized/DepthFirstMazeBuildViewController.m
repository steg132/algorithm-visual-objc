//
//  DepthFirstMazeBuildViewController.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/9/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "DepthFirstMazeBuildViewController.h"

@interface DepthFirstMazeBuildViewController ()
//
@property (nonatomic, strong) NSMutableArray* backTrace;
@end

@implementation DepthFirstMazeBuildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	// Init the backtrace with the origin object in the maze
	[self setBackTrace:[NSMutableArray arrayWithObject:[self maze][0][0]]];
}

-(void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL) isComplete {
	
	for ( int x = 0; x < self.mazeWidth; x += 2) {
		for ( int y = 0; y < self.mazeHeight; y += 2) {
			if ([(MazeCell*)[self maze][x][y] isWall] == true) {
				return false;
			}
		}
	}
	
	return true;
}

-(void) iterate {
	// get the current object
	MazeCell* currentCell = [[self backTrace] lastObject];
	
	NSMutableArray* openCells = [NSMutableArray arrayWithCapacity:3];
	// check west
	if ( currentCell.x - 2 >= 0 ) {
		MazeCell* westCell = [self maze][currentCell.x -2][currentCell.y];
		if (westCell.isWall == true) {
			[openCells addObject:westCell];
		}
	}

	// check north
	if ( currentCell.y - 2 >= 0) {
		MazeCell* northCell = [self maze][currentCell.x][currentCell.y -2];
		if ( northCell.isWall == true ) {
			[openCells addObject:northCell];
		}
	}
	
	MazeCell* eastCell = nil;
	// check east
	if ( currentCell.x + 2 < self.mazeWidth ) {
		eastCell = [self maze][currentCell.x +2][currentCell.y];
		if (eastCell.isWall == true) {
			[openCells addObject:eastCell];
		} else {
			eastCell = nil;
		}
	}
	
	// check South
	if ( currentCell.y + 2 < self.mazeHeight) {
		MazeCell* southCell = [self maze][currentCell.x][currentCell.y +2];
		if ( southCell.isWall == true ) {
			[openCells addObject:southCell];
		}
	}
	
	// check for any open cells
	if ([openCells count] == 0) {
		// no open cells, up the back trace!
		// update the current cell
		[currentCell setIsBacktraced:true];
		[currentCell setIsCurrent:false];
		// pop the current cell off the back stack
		[[self backTrace] removeLastObject];
		
		// update the path cell
		[(MazeCell*)[[self backTrace] lastObject] setIsBacktraced:true];
		// remove the path cell
		[[self backTrace] removeLastObject];
		
		// update the last object's state to be the current cell
		[(MazeCell*)[[self backTrace] lastObject] setIsCurrent:true];
	} else {
		// Select a random cell
		MazeCell* nextCell = nil;
		if ( eastCell != nil && arc4random_uniform(2) == 0) {
			nextCell = eastCell;
		} else {
			nextCell =[openCells
					   objectAtIndex:arc4random_uniform((u_int32_t)[openCells count])];
		}
		
		// get the intermediate cell
		MazeCell* pathCell = [self maze][(nextCell.x + currentCell.x) / 2]
		[(nextCell.y + currentCell.y) /2];

		// update the cell states
		[pathCell setIsWall:false];
		[nextCell setIsWall:false];
		
		// update the current cell
		[currentCell setIsCurrent:false];
		[nextCell setIsCurrent:true];
		
		// add these new cells to the back stack
		[[self backTrace] addObject:pathCell];
		[[self backTrace] addObject:nextCell];
		
	}
}

@end






