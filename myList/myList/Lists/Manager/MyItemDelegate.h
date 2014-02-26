//
//  MyItemDelegate.h
//  myList
//
//  Created by Frank on 22.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemModel.h"
#import "ListModel.h"

@protocol MyItemCallBack <NSObject>

- (void)didSelectItem:(ItemModel *)selectedItem;

@end

@interface MyItemDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>

@property id <MyItemCallBack> myItemViewController;

+ (MyItemDelegate *)myItemInstance;
- (void)fillItemListWith:(NSArray *)itemArray;


@end
