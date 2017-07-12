//
//  ToDoTableViewCell.m
//  2w3d2_everyDo
//
//  Created by Seantastic31 on 11/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "ToDoTableViewCell.h"
#import "ToDo.h"

@interface ToDoTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (strong, nonatomic) ToDo *myToDo;

@end

@implementation ToDoTableViewCell

- (void)configureToDoCell:(ToDo*)toDo // part 1
{
    self.myToDo = toDo;
    
    // set labels
    self.titleLabel.text = toDo.title;
    self.descriptionLabel.text = toDo.todoDescription;
    self.priorityLabel.text = [NSString stringWithFormat:@"%i", toDo.priorityNumber];
    
    if (toDo.isCompleted)
    {
        [self strikeThruTitle];
    }
    
}

- (void)strikeThruTitle // part 1
{
    if (self.myToDo.isCompleted == YES)
    {
        NSMutableAttributedString *strikeThru = [[NSMutableAttributedString alloc]initWithString:self.myToDo.title];
        [strikeThru addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, strikeThru.length)];
        // *** attributedText ***
        self.titleLabel.attributedText = [strikeThru mutableCopy];
    }
    self.myToDo.isCompleted = !self.myToDo.isCompleted;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
