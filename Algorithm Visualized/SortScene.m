//
//  SortScene.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/15/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "SortScene.h"

@interface SortScene ()
@end

@implementation SortScene

-(int) dataLength {
	return 150;
}

-(void) didMoveToView:(SKView *)view {
	[super didMoveToView:view];
	// check to see if we already have our data
	if ([self data] == NULL) {
		[self buildData];
		[self initNodes];
		self.iterationComplete = true;
	}
}

-(void) update:(NSTimeInterval)currentTime {
	[super update:currentTime];
	if ( self.iterationComplete == true) {
		[self iterate];
	}
}

- (void) buildData {
	
	NSMutableArray* data = [NSMutableArray arrayWithCapacity:self.dataLength];
	for ( int i = 0; i < self.dataLength; i++) {
		data[i] = [NSNumber numberWithInt:self.dataLength - i];
	}
	
	for (int i = 0; i < self.dataLength; i++) {
		int toIndex = (i + arc4random_uniform(self.dataLength))  % self.dataLength;
		NSNumber* t = data[toIndex];
		data[toIndex] = data[i];
		data[i] = t;
	}
	
	[self setData:data];
}

-(void) initNodes {
	float width = [self size].width / self.dataLength;
	NSMutableArray* bars = [NSMutableArray arrayWithCapacity:[self.data count]];
	float brightness = ((float)arc4random_uniform(10)) / 20.0f + 0.5f;
	float saturation = ((float)arc4random_uniform(10)) / 20.0f + 0.5f;
	
	for (int i = 0; i < [self.data count]; i++) {
		NSNumber* number = [self data][i];
		float ratio = ([number floatValue] / self.dataLength);
		float height = [self size].height * ratio;
		UIColor * color = [UIColor colorWithHue:ratio
									 saturation:saturation
									 brightness:brightness
										  alpha:1.0];
		SKSpriteNode* node = [SKSpriteNode spriteNodeWithColor:color
														  size:CGSizeMake(width, height)];
		[node setPosition:CGPointMake(width * i + width* 0.5, height * 0.5)];
		[self addChild:node];
		[bars addObject:node];
	}
	
	[self setBarGeometry:bars];
}

-(void) iterate {
	// empty implimentation
}
@end
