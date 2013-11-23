//
//  pplDrillListTableViewController.m
//  Practice Planner
//
//  Created by Mark Haskamp on 11/23/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import "pplDrillListTableViewController.h"
#import "pplDrillTableViewCell.h"
#import "pplDrillStore.h"
#import "pplDrill.h"
#import "pplDrillStoreFactory.h"
#import "pplDrillDescriptionViewController.h"


@interface pplDrillListTableViewController ()

@end

@implementation pplDrillListTableViewController

@synthesize drillStore, descriptionPopover;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    drillStore = [pplDrillStoreFactory Create:@"test"];
    [drillStore loadAllDrills];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [drillStore.drills count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DrillListCell";
    pplDrillTableViewCell *cell =
    (pplDrillTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                             forIndexPath:indexPath];
    
    // Configure the cell...
    pplDrill *drill = (pplDrill *)[drillStore.drills objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = drill.name;
    cell.detailTextLabel.text = [drill buildTagString];
    
    UISwipeGestureRecognizer *gesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    gesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell.contentView addGestureRecognizer:gesture];
    
    return cell;
}

-(void)didSwipe:(UIGestureRecognizer *)gestureRecognizer {
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint swipeLocation = [gestureRecognizer locationInView:self.tableView];
        NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
        UITableViewCell* swipedCell = [self.tableView cellForRowAtIndexPath:swipedIndexPath];
        
        NSNotification *note = [NSNotification notificationWithName:@"AddDrill" object:swipedCell];
        [[NSNotificationCenter defaultCenter] postNotification:note];
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    pplDrill *drill = (pplDrill *)[drillStore.drills objectAtIndex:indexPath.row];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    pplDrillDescriptionViewController *drillDescriptionController =
    [sb instantiateViewControllerWithIdentifier:@"DrillDescription"];
    [drillDescriptionController loadView];
    drillDescriptionController.titleLabel.text = drill.name;
    drillDescriptionController.descriptionText.text = drill.description;
    
    self.descriptionPopover =
    [[UIPopoverController alloc] initWithContentViewController:drillDescriptionController];
    
    self.descriptionPopover.popoverContentSize = CGSizeMake(320, 320);
    
    
    [self.descriptionPopover presentPopoverFromRect:cell.bounds
                                             inView:cell.contentView
                           permittedArrowDirections:UIPopoverArrowDirectionAny
                                           animated:YES];
    
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"This Is The Title";
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 75.0;
}

@end
