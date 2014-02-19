//
//  MyRecommendedListDelegate.h
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListModel.h"

@protocol MyRecListCallBack <NSObject>

- (void) didSelectList:(ListModel *)selectedList;

@end


@interface MyRecommendedListDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>

@property id <MyRecListCallBack> callBackDelegate;

+ (MyRecommendedListDelegate *)myRecListInstance;
- (void)fillListWith:(NSArray *)listArray;

@end

