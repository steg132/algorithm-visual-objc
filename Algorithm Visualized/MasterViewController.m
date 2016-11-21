//
//  MasterViewController.m
//  Algorithm Visualized
//
//  Created by Ryan Schumacher on 4/5/15.
//  Copyright (c) 2015 Ryan Schumacher. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"


@interface MasterViewController ()
@property (nonatomic, retain) NSArray* sortingCells;
@end

@implementation MasterViewController

- (void)awakeFromNib {
	[super awakeFromNib];
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
	    self.clearsSelectionOnViewWillAppear = NO;
	    self.preferredContentSize = CGSizeMake(320.0, 600.0);
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	//	self.navigationItem.leftBarButtonItem = self.editButtonItem;

	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
	
	[self setSortingCells:@[@"BubbleSortCell", @"MergeSortCell",
							@"QuickSortCell", @"RadixSortCell",
							@"DepthFirstMazeBuild"]];
	
	[[self tableView] selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]
								  animated:true scrollPosition:UITableViewScrollPositionTop];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
	    UIViewController *controller = [[segue destinationViewController] topViewController];
	    controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
	    controller.navigationItem.leftItemsSupplementBackButton = YES;
	}
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.sortingCells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self sortingCells][indexPath.row]];

	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return NO;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//	if (editingStyle == UITableViewCellEditingStyleDelete) {
//	    [self.objects removeObjectAtIndex:indexPath.row];
//	    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
//	    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//	}
//}

@end
