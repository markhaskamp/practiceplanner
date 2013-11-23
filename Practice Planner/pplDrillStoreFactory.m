//
//  pplDrillStoreFactory.m
//  Practice Planner
//
//  Created by Mark Haskamp on 11/23/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import "pplDrillStoreFactory.h"
#import "pplDrillStore_Test.h"

@implementation pplDrillStoreFactory

+(pplDrillStore *)Create:(NSString *)drillStoreDescriptor
{
    if ([drillStoreDescriptor isEqualToString:@"test"]) {
        return [[pplDrillStore_Test alloc] init];
    }
    
    [NSException raise:@"Unknown descriptor" format:nil];
    
    return nil;
}

@end
