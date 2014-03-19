//
//  DatabaseManager.h
//  myList
//
//  Created by Frank Regel on 12.03.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ListModel;

@interface DatabaseManager : NSObject

- (NSArray *)getItemsFromDatabaseWithName:(NSString *)databaseName fromTable:(NSString *)tableName andConstraint:(NSString *)constraint;
- (void)addItemsToDatabaseWithName:(NSString *)databaseName inTable:(NSString *)tableName whithItem:(NSArray *)newItemArray;
- (NSMutableArray *)getListsFromDatabaseWithName:(NSString *)databaseName fromTable:(NSString *)tableName andConstraint:(NSString *)constraint;
- (void)addListToDatabaseWithName:(NSString *)databaseName inTable:(NSString *)tableName whithList:(ListModel *)newList;

@end
