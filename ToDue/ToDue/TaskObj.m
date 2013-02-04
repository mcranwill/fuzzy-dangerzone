	//
//  TaskObj.m
//  ToDue
//
//  Created by Mike Cranwill on 1/31/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "TaskObj.h"

@implementation TaskObj

-(id) initWithText:(NSMutableAttributedString *)text {
    self = [super init ];
    
    if (self) {
        _text = text;
        return self;
    }
    return nil;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_text forKey:@"theText"];
}

/*-(id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init])) {
        theText = [aDecoder decodeObjectForKey:@"theText"];
    }
    return self;
}*/

-(id)initWithCoder:(NSKeyedUnarchiver *)aDecoder
{
    if ((self = [super init])) {
        [self setText:[aDecoder decodeObjectForKey:@"theText"]];
     //   [self setText:[aDecoder decodeObjectForKey:@"theText"]];
    }
    return self;
}
@end
