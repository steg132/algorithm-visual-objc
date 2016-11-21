//
//  SortViewController.h
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/7/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarGraphView.h"
#import "DetailViewController.h"


@interface SortViewController : DetailViewController
@property (nonatomic, readonly) int dataLength;
@property (nonatomic, retain) NSArray *data;
@property (nonatomic, strong) IBOutlet BarGraphView *barGraphView;

-(NSArray*) sortData;
@end
