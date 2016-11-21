//
//  BubbleSortViewController.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/5/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "BubbleSortViewController.h"
#import "BubbleSortScene.h"

@interface BubbleSortViewController ()

@end

@implementation BubbleSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.spriteView.showsDrawCount = YES;
	self.spriteView.showsNodeCount = YES;
	self.spriteView.showsFPS = YES;
	
	
}

-(void) viewWillAppear:(BOOL)animated {
	BubbleSortScene* scene = [BubbleSortScene sceneWithSize:[self.view bounds].size];
	
	[self.spriteView presentScene:scene];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
