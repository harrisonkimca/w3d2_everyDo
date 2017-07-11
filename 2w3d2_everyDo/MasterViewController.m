//
//  MasterViewController.m
//  2w3d2_everyDo
//
//  Created by Seantastic31 on 11/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoTableViewCell.h"

@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupToDos];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}


- (void)setupToDos // part 1
{
    self.objects = [[NSMutableArray alloc]init];
    
    ToDo *myToDo1 = [[ToDo alloc]initWithTitle:@"Groceries"
                            andToDoDescription:@"Get full again"
                             andPriorityNumber:2
                                andIsCompleted:NO];
    
    ToDo *myToDo2 = [[ToDo alloc]initWithTitle:@"Work Out"
                            andToDoDescription:@"Get skinny again"
                             andPriorityNumber:1
                                andIsCompleted:NO];
    
    ToDo *myToDo3 = [[ToDo alloc]initWithTitle:@"Pay Bills"
                            andToDoDescription:@"Get poor again"
                             andPriorityNumber:3
                                andIsCompleted:NO];
    
    ToDo *myToDo4 = [[ToDo alloc]initWithTitle:@"Do Laundry"
                            andToDoDescription:@"Get clean again"
                             andPriorityNumber:1
                                andIsCompleted:YES];
    
    ToDo *myToDo5 = [[ToDo alloc]initWithTitle:@"Vacation"
                            andToDoDescription:@"Get happy again"
                             andPriorityNumber:3
                                andIsCompleted:NO];
    
    [self.objects addObject:myToDo1];
    [self.objects addObject:myToDo2];
    [self.objects addObject:myToDo3];
    [self.objects addObject:myToDo4];
    [self.objects addObject:myToDo5];
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!self.objects)
    {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender // part 2
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *myTodo = self.objects[indexPath.row];
        //NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        //[controller setDetailItem:object];
        [controller setDetailItem:myTodo];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView // part 1
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section // part 1
{
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath // part 1
{
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoTableViewCell" forIndexPath:indexPath];
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    [cell configureToDoCell:self.objects[indexPath.row]];
    //NSDate *object = self.objects[indexPath.row];
    //cell.textLabel.text = [object description];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
    
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath // part 1
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
