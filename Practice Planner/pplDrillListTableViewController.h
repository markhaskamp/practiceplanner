//
//  pplDrillListTableViewController.h
//  Practice Planner
//
//  Created by Mark Haskamp on 11/23/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pplDrillStore.h"

@interface pplDrillListTableViewController : UITableViewController

@property pplDrillStore *drillStore;
@property UIPopoverController *descriptionPopover;

@end
