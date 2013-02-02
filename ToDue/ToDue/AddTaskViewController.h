//
//  AddTaskViewController.h
//  ToDue
//
//  Created by Mike Cranwill on 1/31/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskObj;

@interface AddTaskViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *taskText;
@property (strong, nonatomic) TaskObj *task;
@end
