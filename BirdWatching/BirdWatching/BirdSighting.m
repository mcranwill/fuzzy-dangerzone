//
//  BirdSighting.m
//  BirdWatching
//
//  Created by Mike Cranwill on 1/28/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "BirdSighting.h"

@implementation BirdSighting
-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date
{
    self = [super init];
    if (self) {
        _name = name;
        _location = location;
        _date = date;
        return self;
    }
    return nil;
}
@end
