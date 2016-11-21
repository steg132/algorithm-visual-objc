//
//  QuickSortViewController.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/7/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "QuickSortViewController.h"

@interface QuickSortViewController ()

@end

@implementation QuickSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray*) sortData {
	NSMutableArray* sortedData = [NSMutableArray arrayWithArray:[self data]];
	[self sortData:sortedData start:0 end:(int)[sortedData count]];
	
	return sortedData;
}

// Start is inclusive
// End is exclusive
- (int) pivotIndexOfData:(NSMutableArray*) data start:(int) start end:(int)end {
	return end - 1;
}

-(void) swapData:(NSMutableArray*) data atIndex:(int)index0 withIndex:(int)index1 {
	NSNumber* t = data[index0];
	data[index0] = data[index1];
	data[index1] = t;
}

// Start is inclusive
// End is exclusive
- (void) sortData:(NSMutableArray*) data start:(int) start end:(int)end {
	
	// exit if the indexies are bad
	if ( end - start < 1 ) { return; }
	
	// pick a pivot; use the last element
	int pivot = end-1;
	int iStore = start; // index of right side +1 of less than partition
	// iterate through each item
	for (int i = start; i < pivot; i++) {
		// compare element at i with element at pivot
		if ([data[i] compare:data[pivot]] == NSOrderedAscending) {
			// If it is less than I, swap with the store
			[self swapData:data atIndex:iStore withIndex:i];
			// incement the store
			iStore++;
		}
	}

	// swap the pivot with the current iStore
	[self swapData:data atIndex:iStore withIndex:pivot];
	
	// update the pivot index to its new position
	pivot = iStore;
	
	// sort the partitions
	[self sortData:data start:start end:pivot];
	[self sortData:data start:pivot+1 end:end];
}
@end
