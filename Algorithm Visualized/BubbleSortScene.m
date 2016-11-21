//
//  BubbleSortScene.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/15/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "BubbleSortScene.h"

@interface BubbleSortScene ()
@property (nonatomic, assign) int lastPosition;
@property (nonatomic, assign) BOOL isDataOrdered;
@property (nonatomic, assign) int orderedPosition;
@end

@implementation BubbleSortScene

-(void) didMoveToView:(SKView *)view {
	if ( [self data] == NULL) {
		self.lastPosition = 0;
		self.isDataOrdered = YES;
		self.orderedPosition = self.dataLength -1;
	}
	
	[super didMoveToView:view];
}

-(void) iterate {
	// check if we are at the end...
	if (self.lastPosition >= self.orderedPosition ) {
		if (self.isDataOrdered == YES) {
			// we are done
			return;
		} else {
			self.lastPosition = 0;
			self.isDataOrdered = YES;
			self.orderedPosition -= 1;
		}
	}
	int leftPosition = self.lastPosition;
	int rightPosition = leftPosition + 1;
	NSNumber* left = self.data[leftPosition];
	NSNumber* right = self.data[rightPosition];
	
	SKNode* leftNode = self.barGeometry[leftPosition];
	SKNode* rightNode = self.barGeometry[rightPosition];
	
	if (left.intValue > right.intValue) {
		// Flag that the iteration is not complete
		self.iterationComplete = false;

		// we are unsorted
		self.isDataOrdered = FALSE;
		[self.data replaceObjectAtIndex:leftPosition withObject:right];
		[self.data replaceObjectAtIndex:rightPosition withObject:left];
		
		[self.barGeometry replaceObjectAtIndex:leftPosition withObject:rightNode];
		[self.barGeometry replaceObjectAtIndex:rightPosition withObject:leftNode];
		
		
		[leftNode runAction:[SKAction moveToX:rightNode.position.x duration:0.01]];
		[rightNode runAction:[SKAction moveToX:leftNode.position.x duration:0.0101] completion:^{
			self.iterationComplete = true;
		}];
		self.isDataOrdered = NO;
	}
	
	self.lastPosition += 1;
}

//- (NSArray*) sortData {
//	NSMutableArray * sortingArray = [NSMutableArray arrayWithArray:[self data]];
//	int iterations = DATA_LENGTH;
//	while (true) {
//		bool isOutOfOrder = false;
//		for (int i = 0; i < iterations - 1; i++) {
//			NSNumber* left = sortingArray[i];
//			NSNumber* right = sortingArray[i + 1];
//
//			// check if numbers are out of order
//			if ( left > right) {
//				// if so, swap them
//				NSNumber* t = left;
//				sortingArray[i] = right;
//				sortingArray[i + 1] = t;
//				// flag HasChanged
//				isOutOfOrder = true;
//			}
//		}
//
//		if (isOutOfOrder == false) {
//			break;
//		}
//		// we can skip an iteration
//		iterations--;
//	}
//
//	// set the data
//	return sortingArray;
//
//}

@end
