//
//  MazeBuildViewController.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/9/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "MazeBuildViewController.h"

@interface MazeBuildViewController ()
@property (nonatomic, strong) NSTimer* updateTimer;
@end

@implementation MazeBuildViewController

-(int) mazeHeight {
	return 55;
}
-(int) mazeWidth {
	return 55;
}

-(NSTimeInterval) updateInterval {
	return 0.08;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self initMaze];
	[[self mazeView] setMaze:[self maze]];
	[self.mazeView setMazeHeight:self.mazeHeight];
	[self.mazeView setMazeWidth:self.mazeWidth];
	
}

-(void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self setUpdateTimer:[NSTimer scheduledTimerWithTimeInterval:self.updateInterval
														  target:self
														selector:@selector(update:)
														userInfo:nil
														 repeats:true]];
}

-(void) viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	[self killTimer];
}

-(void) killTimer {
	if ( [self updateTimer]) {
		[[self updateTimer] invalidate];
		[self setUpdateTimer:nil];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initMaze {
	NSMutableArray* gridArray = [NSMutableArray arrayWithCapacity:self.mazeWidth];
	for (int x = 0; x < self.mazeWidth; x++) {
		NSMutableArray* arrayColumn = [NSMutableArray arrayWithCapacity:self.mazeHeight];
		for (int y = 0; y < self.mazeHeight; y++) {
			MazeCell* cell = [MazeCell cellWithPositionX: x Y: y];
//			if (arc4random_uniform(2) == 0) {
//				[cell setIsWall:false];
//				if ( arc4random_uniform(4) == 0) {
//					[cell setIsBacktraced:true];
//				}
//			}
			[arrayColumn addObject:cell];
		}
		[gridArray addObject:arrayColumn];
	}
	
	// Set the maze
	[self setMaze:gridArray];
	MazeCell* rootCell = [self maze][0][0];
	[rootCell setIsWall:false];
	[rootCell setIsCurrent:true];
}

-(void) update:(NSTimer*) timer {
	[self iterate];
	[[self mazeView] setNeedsDisplay];
	if ([self isComplete]) {
		[self killTimer];
	}
}

-(void) iterate {
	// empty iterate stub, should be overridden by child
}
@end
