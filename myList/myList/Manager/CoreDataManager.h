//
//  CoreDataManager.h
//  myList
//
//  Created by Frank Regel on 26.03.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class Lists;


@interface CoreDataManager : NSObject
+ (CoreDataManager *)coreDataInstance;


- (void)saveItem:(NSArray *)itemObjectArray;

- (void)saveList:(Lists *)listObject;

- (NSArray *)loadListArray;


@end
