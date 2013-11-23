//
//  pplPracticeListTableViewController.h
//  Practice Planner
//
//  Created by Mark Haskamp on 11/23/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pplPracticeListTableViewController : UITableViewController

-(void)moveIndex:(NSInteger)fromRowNdx
         toIndex:(NSInteger)ToRowNdx
             for:(NSMutableArray *)practiceList;

@end
