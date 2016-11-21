//
//  MergeSortViewController.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/5/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "MergeSortViewController.h"
#import "MergeSortScene.h"

@interface MergeSortViewController ()

@end

@implementation MergeSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.spriteView.showsDrawCount = YES;
	self.spriteView.showsNodeCount = YES;
	self.spriteView.showsFPS = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewWillAppear:(BOOL)animated {
	MergeSortScene* scene = [MergeSortScene sceneWithSize:[self.view bounds].size];
	
	[self.spriteView presentScene:scene];
}



-(void) mergeData:(NSMutableArray*) data start:(int) start middle:(int) mid end:(int) end {
	
	NSUInteger leftIndex = start, rightIndex = mid;
	
	NSMutableArray* orderedArray = [NSMutableArray arrayWithCapacity:end - start];
	
	for ( NSUInteger i = start; i < end; i++) {
		// check if we are still indexing the left list
		if ((leftIndex < mid) && (rightIndex >= end || data[leftIndex] <= data[rightIndex]) ) {
			// add element from left list to ordered array
			// No items in the right list are left, or left item is smaller
			[orderedArray addObject:data[leftIndex]];
			leftIndex++;
		} else {
			// add element from right list to ordered array
			// no items left in left list, or the current item in the right list is smaller
			[orderedArray addObject:data[rightIndex]];
			rightIndex++;
		}
	}
	// overwrite items in data with the ordred array
	[data replaceObjectsInRange:NSMakeRange(start, end - start)
		   withObjectsFromArray:orderedArray];
}


@end
