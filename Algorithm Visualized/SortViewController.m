//
//  SortViewController.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/7/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "SortViewController.h"

@interface SortViewController ()
@property(nonatomic, retain) NSTimer* timer;
@end

@implementation SortViewController

-(int) dataLength {
	return 200;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self buildData];
	[self updateBarGraphView];
	
	
}

-(void)viewWillAppear:(BOOL)animated {
	self.timer = [NSTimer scheduledTimerWithTimeInterval:5
												  target:self
												selector:@selector(fireSortTimer:)
												userInfo:nil
												 repeats:NO];

}

-(void) fireSortTimer:(NSTimer*) timer {
	[self setData:[self sortData]];
	[self updateBarGraphView];
}

-(void) viewWillDisappear:(BOOL)animated {
	if ( [self timer] ) {
		[[self timer] invalidate];
		[self setTimer:nil];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) buildData {
	
	NSMutableArray* data = [NSMutableArray arrayWithCapacity:self.dataLength];
	
	for ( int i = 0; i < [self dataLength]; i++) {
		[data addObject:[NSNumber numberWithInt:self.dataLength - i]];
	}
	
	for (int i = 0; i < self.dataLength; i++) {
		int toIndex = (i + arc4random_uniform(self.dataLength))  % self.dataLength;
		NSNumber* t = data[toIndex];
		data[toIndex] = data[i];
		data[i] = t;
	}
	
	[self setData:data];
	
}

-(void) updateBarGraphView {
	[[self barGraphView] setData:[self data]];
	[[self barGraphView] setMaxValue:self.dataLength];
	[[self barGraphView] setNeedsDisplay];
}


@end
