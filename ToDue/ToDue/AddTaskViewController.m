//
//  AddTaskViewController.m
//  ToDue
//
//  Created by Mike Cranwill on 1/31/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "AddTaskViewController.h"
#import "TaskObj.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL) textFieldShouldReturn:(UITextField *) textField {
    if (textField == self.taskText) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        if ([self.taskText.text length] ) {
            TaskObj *task1;
           // NSDate *today = [NSDate date];
            NSAttributedString *temp = [[NSAttributedString alloc] initWithString:self.taskText.text attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Noteworthy-Bold" size:36], NSUnderlineStyleAttributeName : @1 , NSStrokeColorAttributeName : [UIColor blackColor]}];
            task1 = [[TaskObj alloc] initWithText:temp ];
            self.task = task1;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
