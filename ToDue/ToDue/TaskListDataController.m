//
//  TaskListDataController.m
//  ToDue
//
//  Created by Mike Cranwill on 1/31/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "TaskListDataController.h"
#import "TaskObj.h"

@interface TaskListDataController ()
- (void)initializeDefaultDataList;
@end

@implementation TaskListDataController

- (void)initializeDefaultDataList {
    NSMutableArray *taskList = [[NSMutableArray alloc] init];
    self.masterTaskList = taskList;
    //TaskObj *task;
    //NSDate *today = [NSDate date];
    //task = [[TaskObj alloc] initWithText:@"Clean Clothes" ];
    //[self addTaskWithText:task];
}

- (void)setMasterTaskList:(NSMutableArray *)newList {
    if (_masterTaskList != newList) {
        _masterTaskList = [newList mutableCopy];
    }
}

- (NSMutableAttributedString *) updateAttrText:(NSUInteger)theIndex {
    TaskObj *temptoUpdate = [self.masterTaskList objectAtIndex:theIndex];
    
    NSMutableAttributedString *temp = [[NSMutableAttributedString alloc] initWithString:temptoUpdate.text.string attributes:@{ NSForegroundColorAttributeName : [UIColor redColor]}];
    [temp addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:2] range:NSMakeRange(0, temp.length)];
    return temp;
}

- (void) removeObjectAtIndex:(NSUInteger)theIndex {
    [self.masterTaskList removeObjectAtIndex:theIndex];
}

- (BOOL) isHighlighted:(NSUInteger)theIndex {
 //   TaskObj *temp = [self.masterTaskList objectAtIndex:theIndex];
//    NSString *a =[temp.text attribute:NSStrikethroughStyleAttributeName atIndex:0 effectiveRange:NULL];
//    if (a )
    return true;
}

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (NSUInteger)countOfList {
    return [self.masterTaskList count];
}

- (TaskObj *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterTaskList objectAtIndex:theIndex];
}

- (void)addTaskWithText:(TaskObj *)task {
    [self.masterTaskList addObject:task];
}

@end
