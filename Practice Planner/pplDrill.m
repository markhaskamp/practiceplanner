//
//  pplDrill.m
//  Practice Planner
//
//  Created by Mark Haskamp on 11/23/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import "pplDrill.h"

@implementation pplDrill

@synthesize name, description, tags;

-(id) initWithName:(NSString *)m_name
   withDescription:(NSString *)m_description
          withTags:(NSMutableArray *)m_tags
{
    self = [super init];
    if (self != nil) {
        self.name = m_name;
        self.description = m_description;
        self.tags = m_tags;
    }
    
    return self;
}

-(NSString *)buildTagString
{
    NSString *returnString = @"";
    for(NSString *s in self.tags) {
        returnString = [returnString stringByAppendingFormat:@"%@ ", s];
    }
    
    return returnString;
}

@end
