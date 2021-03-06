//
//  TaskListDataController.h
//  ToDue
//
//  Created by Mike Cranwill on 1/31/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TaskObj;

@interface TaskListDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterTaskList;
- (NSUInteger)countOfList;
- (TaskObj *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addTaskWithText:(TaskObj *)task;
- (void) removeObjectAtIndex:(NSUInteger) theIndex;
- (BOOL) isMarkedAsFinished:(NSUInteger) theIndex;
- (NSMutableAttributedString *) updateAttrText:(NSUInteger) theIndex;
- (NSDictionary *) nsDictionaryCopyofMasterTaskList;
@end
