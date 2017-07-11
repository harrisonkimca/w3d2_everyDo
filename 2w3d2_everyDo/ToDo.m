//
//  ToDo.m
//  2w3d2_everyDo
//
//  Created by Seantastic31 on 11/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithTitle:(NSString *)title andToDoDescription:(NSString *)todoDescription andPriorityNumber:(int)priorityNumber andIsCompleted:(BOOL)isCompleted // part 1
{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = todoDescription;
        _priorityNumber = priorityNumber;
        _isCompleted = isCompleted;
    }
    return self;
}

@end
