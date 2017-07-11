//
//  DetailViewController.m
//  2w3d2_everyDo
//
//  Created by Seantastic31 on 11/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "DetailViewController.h"
#import "ToDo.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailPriorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem)
    {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}


- (void)configureView // part 2
{
    // Update the user interface for the detail item.
    if (self.detailItem)
    {
        if ([self.detailItem isKindOfClass:[ToDo class]])
        {
            ToDo *myToDo = self.detailItem;
            
            self.detailTitleLabel.text = myToDo.title;
            self.detailPriorityLabel.text = [NSString stringWithFormat:@"%i", myToDo.priorityNumber];
            self.detailDescriptionLabel.text = myToDo.todoDescription;
        }
        //self.detailDescriptionLabel.text = [self.detailItem description];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
