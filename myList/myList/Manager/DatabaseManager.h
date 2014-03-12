//
//  DatabaseManager.h
//  myList
//
//  Created by Frank Regel on 12.03.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseManager : NSObject

- (NSArray *)getItemsFromDatabaseWithName:(NSString *)databaseName fromTable:(NSString *)tableName andConstraint:(NSString *)constraint;

@end
