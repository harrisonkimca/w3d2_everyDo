//
//  AddItemViewController.m
//  2w3d2_everyDo
//
//  Created by Seantastic31 on 11/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "AddItemViewController.h"
#import "ToDo.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UILabel *addToDoLabel;
@property (weak, nonatomic) IBOutlet UILabel *addTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *addPriorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *addDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *addTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *addPriorityTextField;
@property (weak, nonatomic) IBOutlet UITextView *addDescriptionTextView;
@property (weak, nonatomic) IBOutlet UIButton *addDoneButton;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addTitleTextField.layer.borderWidth = 0.5;
    self.addPriorityTextField.layer.borderWidth = 0.5;
    self.addDescriptionTextView.layer.borderWidth = 0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButton:(UIButton *)sender // part 3
{
    [self makeNewToDo];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)makeNewToDo // part 3
{
    if (![self.addTitleTextField.text isEqualToString:@""] ||
        ![self.addPriorityTextField.text isEqualToString:@""] ||
        ![self.addDescriptionTextView.text isEqualToString:@""])
    {
        ToDo *myToDo = [[ToDo alloc]initWithTitle:self.addTitleTextField.text
                               andToDoDescription:self.addDescriptionTextView.text
                                andPriorityNumber:[self.addPriorityTextField.text intValue]
                                   andIsCompleted:NO];
        
        // ***** pass myToDo to the delegate *****
        [self.delegate addToDo:myToDo];
    }
}

#pragma mark Keyboard

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    return YES; // returning YES allows editing
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(makeNewToDo) name:UITextFieldTextDidChangeNotification object:nil];
     return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [self.view endEditing:YES];
    [self makeNewToDo];
    return NO;
}

- (void)keyboardWillShow:(NSNotificationCenter*)notification
{
    [UIView animateWithDuration:0.3f animations:^{
        self.view.frame = CGRectMake(0, -110, self.view.frame.size.width, self.view.frame.size.height);
    }];
}

- (void)keyboardWillHide:(NSNotificationCenter*)notification
{
    [UIView animateWithDuration:0.3f animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.addTitleTextField resignFirstResponder];
    [self.addPriorityTextField resignFirstResponder];
    [self.addDescriptionTextView resignFirstResponder];
}


@end
