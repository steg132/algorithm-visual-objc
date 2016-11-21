//
//  MergeSortScene.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 5/6/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "MergeSortScene.h"
@interface MergeSortScene()
@property (nonatomic, strong) NSMutableArray* operationStack;

@end

@implementation MergeSortScene

-(void) didMoveToView:(SKView *)view {
	[super didMoveToView:view];
	
	[self buildOperationStack];
	

}

-(void) buildOperationStack {
	self.operationStack = [NSMutableArray array];
	[self buildOperationStackStart:0 end:(int)[[self data] count]-1];
	
	NSLog(@"OperationStack Lenght:%lu", [[self operationStack] count]);

}

-(void) buildOperationStackStart:(int) start end:(int) end {
	
	if ( start == end) {
		return;
	}
	
	// get the middle position
	int mid = start + (end - start) / 2;
	
	[self.operationStack addObject:
		@{@"start": [NSNumber numberWithInt:start],
		  @"mid": [NSNumber numberWithInt:mid],
		  @"end": [NSNumber numberWithInt:end]}];
	

	[self buildOperationStackStart:mid+1 end:end];
	[self buildOperationStackStart:start end:mid];
}

-(void) iterate {
	// check if the operation stack is empty
	if ( [self.operationStack count] == 0) {
		return;
	}
	
	// Pop an operation...
	NSDictionary* opp = [self.operationStack lastObject];
	[self.operationStack removeLastObject];
	
	NSNumber* start = opp[@"start"];
	NSNumber* mid = opp[@"mid"];
	NSNumber* end = opp[@"end"];
	
	// Merge the data
	[self mergeDataStart:start.intValue middle:mid.intValue end:end.intValue];
}

-(void) mergeDataStart:(int) start middle:(int) mid end:(int) end {
	
	NSMutableArray* data = self.data;
	NSMutableArray* bars = self.barGeometry;
	
	end = end + 1;
	mid = mid + 1;
	
	NSUInteger leftIndex = start, rightIndex = mid;
	
	NSMutableArray* orderedDataArray = [NSMutableArray arrayWithCapacity:end - start];
	NSMutableArray* orderedBarArray = [NSMutableArray arrayWithCapacity:end - start];
	
	for ( NSUInteger i = start; i < end; i++) {
		// check if we are still indexing the left list
		if ((leftIndex < mid) && (rightIndex >= end || [data[leftIndex] compare:data[rightIndex]] == NSOrderedAscending ) ) {
			// add element from left list to ordered array
			// No items in the right list are left, or left item is smaller
			[orderedDataArray addObject:data[leftIndex]];
			[orderedBarArray addObject:bars[leftIndex]];
			leftIndex++;
		} else {
			// add element from right list to ordered array
			// no items left in left list, or the current item in the right list is smaller
			[orderedDataArray addObject:data[rightIndex]];
			[orderedBarArray addObject:bars[rightIndex]];
			rightIndex++;
		}
	}
	// overwrite items in data with the ordred array
	[data replaceObjectsInRange:NSMakeRange(start, end - start)
		   withObjectsFromArray:orderedDataArray];
	[bars replaceObjectsInRange:NSMakeRange(start, end - start)
		   withObjectsFromArray:orderedBarArray];
	
	// update posisions for ordered bar array
	self.iterationComplete = false;
	for ( int i = 0; i < [orderedBarArray count]; i++) {
		SKSpriteNode* node = orderedBarArray[i];
		CGFloat width = [node size].width;
		[node runAction:[SKAction moveToX:width * (i + start) + (width * 0.5f)
								 duration:0.5f] completion:^{
			self.iterationComplete = true;
		}];
	}
}

@end
