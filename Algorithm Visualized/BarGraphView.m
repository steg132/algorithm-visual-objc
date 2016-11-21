//
//  BarGraphView.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/5/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "BarGraphView.h"

@implementation BarGraphView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	
	if ([self data] == nil) {
		// Bail out
		return;
	}
	
	// helper variables
	CGSize size = rect.size;
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// clear out the current screen
	CGContextClearRect(context, rect);
	
	//set the bar color to gray
	CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);

	float barWidth = size.width  / [[self data] count];
	
	for ( int i = 0; i < [[self data] count]; i++) {
		float x = barWidth * i;
		NSNumber* value = [self data][i];
		float percentValue = [value floatValue] / [self maxValue] ;
		
		CGRect barRect = CGRectMake(x + 1, size.height - (percentValue * size.height),
									barWidth - 1, percentValue * size.height);
		CGContextAddRect(context, barRect);
	}
	CGContextFillPath(context);
	
}

@end
