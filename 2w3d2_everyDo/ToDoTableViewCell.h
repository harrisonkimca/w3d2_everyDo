//
//  ToDoTableViewCell.h
//  2w3d2_everyDo
//
//  Created by Seantastic31 on 11/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface ToDoTableViewCell : UITableViewCell

- (void)configureToDoCell:(ToDo*)toDo;
- (void)strikeThruTitle;

@end
