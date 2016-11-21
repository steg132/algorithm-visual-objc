//
//  BarGraphView.h
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/5/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarGraphView : UIView
@property (nonatomic, strong) NSArray* data;
@property (nonatomic, assign) int maxValue;

@end
