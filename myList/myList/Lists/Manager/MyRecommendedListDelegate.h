//
//  MyRecommendedListDelegate.h
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecModel.h"

@protocol MyRecListCallBack <NSObject>

- (void)didSelectRecommendation:(RecModel *)selectedRecommendation;

@end


@interface MyRecommendedListDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>

@property id <MyRecListCallBack> myRecListViewController;

+ (MyRecommendedListDelegate *)myRecListInstance;
- (void)fillRecListWith:(NSArray *)recArray;

@end

