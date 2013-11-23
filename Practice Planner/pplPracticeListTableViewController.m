//
//  pplPracticeListTableViewController.m
//  Practice Planner
//
//  Created by Mark Haskamp on 11/23/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import "pplPracticeListTableViewController.h"

@interface pplPracticeListTableViewController ()

@end

@implementation pplPracticeListTableViewController

NSMutableArray *practiceList;

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
    
    practiceList = [NSMutableArray array];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(addDrill:)
               name:@"AddDrill"
             object:nil];
    
    [self setEditing:YES];
}

-(void)addDrill:(NSNotification *)note {
    id poster = [note object];
    UITableViewCell *drillCell = (UITableViewCell *)poster;
    
    [practiceList addObject:drillCell];
    
    UITableView *tableView = (UITableView *)[self view];
    [tableView reloadData];
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
    return [practiceList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PracticeListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    UITableViewCell *drillCell = (UITableViewCell *)practiceList[indexPath.row];
    cell.textLabel.text = drillCell.textLabel.text;
    cell.detailTextLabel.text = drillCell.detailTextLabel.text;
    
    UISwipeGestureRecognizer *gesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    gesture.direction = UISwipeGestureRecognizerDirectionRight;
    [cell.contentView addGestureRecognizer:gesture];
    
    return cell;
}

-(void)didSwipe:(UIGestureRecognizer *)gestureRecognizer {
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint swipeLocation = [gestureRecognizer locationInView:self.tableView];
        NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
        NSMutableArray *npList = [NSMutableArray arrayWithObjects:swipedIndexPath, nil];
        
        int row = swipedIndexPath.row;
        [practiceList removeObjectAtIndex:row];
        [self.tableView deleteRowsAtIndexPaths:npList
                              withRowAnimation:UITableViewRowAnimationAutomatic];
        
        UITableView *practiceListTableView = [self tableView];
        [practiceListTableView reloadData];
    }
}

-(void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
     toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self moveIndex:sourceIndexPath.row toIndex:destinationIndexPath.row for:practiceList];
    UITableViewCell *cell = (UITableViewCell *)practiceList[sourceIndexPath.row];
    NSLog(@"practiceList[%d]: %@", sourceIndexPath.row, cell.textLabel.text);
}

- (void) tableView:( UITableView *)tableView
commitEditingStyle:( UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:( NSIndexPath *) indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UITableViewCell *foo = [practiceList objectAtIndex:indexPath.row];
        [practiceList removeObjectIdenticalTo:foo];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths
              withRowAnimation:(UITableViewRowAnimation)animation
{
    NSLog(@"deleteRowsAtIndexPaths");
}

-(void)moveIndex:(NSInteger)fromRowNdx
         toIndex:(NSInteger)toRowNdx
             for:(NSMutableArray *)practiceList
{
    if(fromRowNdx == toRowNdx) {
        return;
    }
    
    int lowNdx = fromRowNdx;
    int highNdx = toRowNdx;
    
    if (fromRowNdx > toRowNdx) {
        lowNdx = toRowNdx;
        highNdx = fromRowNdx;
    }
    
    UITableViewCell *tmp = practiceList[highNdx];
    for (int ndx = highNdx; ndx > lowNdx; ndx--) {
        practiceList[ndx] = practiceList[ndx-1];
    }
    
    practiceList[lowNdx] = tmp;
}

@end
