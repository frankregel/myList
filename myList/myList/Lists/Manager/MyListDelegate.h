//
//  MyListDelegate.h
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListModel.h"
@protocol MyListCallBack <NSObject>

- (void)didSelectList:(ListModel *)selectedList;

@end

@interface MyListDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>

@property id <MyListCallBack> callBackDelegate;

+ (MyListDelegate *)myListInstance;
- (void)fillListWith:(NSArray *)listArray;

@end

