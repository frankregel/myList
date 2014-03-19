//
//  MyListDelegate.h
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListModel.h"

typedef void (^CallbackHandler)(ListModel *selectedList);

@protocol MyListCallBack <NSObject>

- (void)didSelectList:(ListModel *)selectedList;

@end

@interface MyListDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>

@property id <MyListCallBack> myListViewController;

+ (MyListDelegate *)myListInstance;
- (void)fillListWith:(NSArray *)listArray;

- (void)fillListWith:(NSArray *)listArray andCallbackHandler:(CallbackHandler)handler;

@end

