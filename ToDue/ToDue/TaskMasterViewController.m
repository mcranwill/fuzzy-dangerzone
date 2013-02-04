//
//  TaskMasterViewController.m
//  ToDue
//
//  Created by Mike Cranwill on 1/31/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "TaskMasterViewController.h"
#import "TaskDetailViewController.h"

#import "TaskListDataController.h"
#import "TaskObj.h"
#import "AddTaskViewController.h"


@implementation TaskMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[TaskListDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:app];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // paths[0];
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *archivePath = [documentsDirectory stringByAppendingPathComponent:@"data.tlist"];

    if ([fileManager fileExistsAtPath:archivePath] == YES)
    {
        //Decode
        NSData *data = [NSData dataWithContentsOfFile:archivePath];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        
        NSMutableString *temp = [[NSMutableString alloc] init];
        [temp appendString:@"key1"];
        while ([unarchiver containsValueForKey:temp]) {
            TaskObj *temporaryTask =[[TaskObj alloc] init];
            temporaryTask = [unarchiver decodeObjectForKey:temp];
            [self.dataController addTaskWithText:[unarchiver decodeObjectForKey:temp]];
            [temp appendString:@"1"];
        }
    }
}

- (void)applicationDidEnterBackground:(NSNotification *)notification {
    NSLog(@"Entering Background");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // paths[0];
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *archivePath = [documentsDirectory stringByAppendingPathComponent:@"data.tlist"];
    
    NSMutableData *data = [NSMutableData data];
    
    TaskObj *each;
    NSMutableString *temp = [[NSMutableString alloc] init];
    [temp appendString:@"key"];
    
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    for (each in self.dataController.masterTaskList) {
        [temp appendString:@"1"];
        [archiver encodeObject:each forKey: temp];
    }
    [archiver finishEncoding];
    BOOL success = [data writeToFile:archivePath atomically:YES];
    if (success) {
        NSLog(@"printed successfully");
    }else {
        NSLog(@"something failed");
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        AddTaskViewController *addController = [segue sourceViewController];
        if (addController.task) {
            [self.dataController addTaskWithText:addController.task];
            [[self tableView] reloadData];
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TaskListCell";
    
    TaskObj *taskAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if([self.dataController isMarkedAsFinished:indexPath.row]){
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    NSMutableAttributedString *s =[self.dataController updateAttrText:indexPath.row];
    taskAtIndex.text = s;
    [[cell textLabel] setAttributedText:s];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
    static NSString *CellIdentifier = @"TaskListCell";
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    TaskObj *taskAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    //[[cell textLabel] setText:taskAtIndex.text.string];
    [[cell textLabel] setAttributedText:taskAtIndex.text];
   // [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *)sightingAtIndex.date]];
    return cell;
}
/*- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [self.dataController ]
    }

}*/

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataController removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        detailViewController.sighting = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}*/

@end
