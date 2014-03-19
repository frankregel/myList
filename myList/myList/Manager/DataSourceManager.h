//
//  DataSourceManager.h
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ListModel;

@interface DataSourceManager : NSObject

@property NSMutableArray *noteBookArray;

+ (DataSourceManager *)useDataMethod;

- (NSArray *)getLists;
- (NSArray *)getRecList;
- (NSArray *)loadDataFromWanWith:(NSString *)quellURL and:(NSString *)keyForObject;
- (NSMutableArray *)getPicsFromWanWith:(NSString *)stringForKey inPostArray:(NSArray *)thumbNailArray;
- (void)saveItemToFileWith:(NSString *)newItem andTimeStamp:(NSString *)uniqueTimeStamp;
- (NSDictionary *)loadListDict;
- (void)addItems:(NSArray *)itemArray;
- (void)addList:(ListModel *)newList;

@end
