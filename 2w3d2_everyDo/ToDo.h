//
//  ToDo.h
//  2w3d2_everyDo
//
//  Created by Seantastic31 on 11/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *todoDescription;
@property (nonatomic) int priorityNumber;
@property (nonatomic) BOOL isCompleted;

-(instancetype)initWithTitle:(NSString*)title andToDoDescription:(NSString*)todoDescription andPriorityNumber:(int)priorityNumber andIsCompleted:(BOOL)isCompleted;


@end
