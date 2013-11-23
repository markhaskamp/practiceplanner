//
//  pplDrill.h
//  Practice Planner
//
//  Created by Mark Haskamp on 11/23/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface pplDrill : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSMutableArray *tags;


-(id)initWithName:(NSString *)name withDescription:(NSString *)description withTags:(NSMutableArray *)tags;
-(NSString *)buildTagString;

@end
