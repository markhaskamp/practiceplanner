//
//  pplDrillStore.h
//  Practice Planner
//
//  Created by Mark Haskamp on 11/23/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface pplDrillStore : NSObject

@property (nonatomic, strong) NSMutableArray *drills;

-(void)loadAllDrills;

@end
