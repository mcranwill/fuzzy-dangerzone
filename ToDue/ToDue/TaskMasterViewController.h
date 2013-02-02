//
//  TaskMasterViewController.h
//  ToDue
//
//  Created by Mike Cranwill on 1/31/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskListDataController;

@interface TaskMasterViewController : UITableViewController
@property (strong, nonatomic) TaskListDataController *dataController;
- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;
@end
