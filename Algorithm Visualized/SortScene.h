//
//  SortScene.h
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/15/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SortViewController.h"

@interface SortScene : SKScene

@property (nonatomic, strong) NSMutableArray* data;
@property (nonatomic, strong) NSMutableArray* barGeometry;
@property (nonatomic, assign) BOOL iterationComplete;
@property (nonatomic, readonly) int dataLength;


-(void) iterate;
@end
