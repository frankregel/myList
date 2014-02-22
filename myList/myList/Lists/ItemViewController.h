//
//  ItemViewController.h
//  myList
//
//  Created by Frank on 22.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "BaseListViewController.h"
#import "ItemModel.h"

@interface ItemViewController : BaseListViewController

- (void)setSelectedItemWith:(ItemModel *)selectedItem;

@end
