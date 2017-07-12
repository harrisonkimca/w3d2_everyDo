//
//  AddItemViewController.h
//  2w3d2_everyDo
//
//  Created by Seantastic31 on 11/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol AddToDoDelegate <NSObject> // part 3

- (void)addToDo:(ToDo*)toDo;

@end

@interface AddItemViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <AddToDoDelegate> delegate; // part 3

@end
