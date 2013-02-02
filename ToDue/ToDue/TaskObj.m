	//
//  TaskObj.m
//  ToDue
//
//  Created by Mike Cranwill on 1/31/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "TaskObj.h"

@implementation TaskObj

-(id) initWithText:(NSAttributedString *)text {
    self = [super init ];
    
    if (self) {
        _text = text;
        return self;
    }
    return nil;
}
@end
