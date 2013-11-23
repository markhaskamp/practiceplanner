//
//  pplDrillStore_Test.m
//  Practice Planner
//
//  Created by Mark Haskamp on 11/23/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import "pplDrillStore.h"
#import "pplDrillStore_Test.h"
#import "pplDrill.h"

@implementation pplDrillStore_Test

-(void)loadAllDrills
{
    
    super.drills = [[NSMutableArray alloc] init];
    [super.drills addObject:[[pplDrill alloc] initWithName:@"1 Drill"
                                           withDescription:@"1 is the loneliest number"
                                                  withTags: [[NSMutableArray alloc]
                                                            initWithObjects:@"team-defense", @"defense", nil]]];
    
    [super.drills addObject:[[pplDrill alloc] initWithName:@"2 Drill"
                                           withDescription:@"two's company"
                                                  withTags:[[NSMutableArray alloc] initWithObjects:@"team-offense", @"offense", nil]]];
    
    [super.drills addObject:[[pplDrill alloc] initWithName:@"3 Drill"
                                           withDescription:@"Three's a crowd."
                                                  withTags:[[NSMutableArray alloc] initWithObjects:@"free-throws", nil]]];
    
    [super.drills addObject:[[pplDrill alloc] initWithName:@"4 Drill"
                                           withDescription:@"4 on the floor"
                                                  withTags:[[NSMutableArray alloc] initWithObjects:@"inbounds-play", nil]]];
    
}

@end
