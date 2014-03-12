//
//  DatabaseManager.m
//  myList
//
//  Created by Frank Regel on 12.03.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "DatabaseManager.h"
#import <sqlite3.h>

@interface DatabaseManager ()

@end

@implementation DatabaseManager

- (id)init
{
    self = [super init];
    if (self)
    {
        //Datenbank öffnen --- ** beduten "&" verwenden
        
        
    }
    return self;
}

#pragma mark - getter und setter für die DB

- (NSArray *)getItemsFromDatabaseWithName:(NSString *)databaseName fromTable:(NSString *)tableName andConstraint:(NSString *)constraint
{
    sqlite3 *database;
    NSString *absolutePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:databaseName];
    sqlite3_open([absolutePath UTF8String], &database);
    NSMutableArray *mutableItemArray = [NSMutableArray new];
    NSString *statement;
    if (![constraint isEqualToString:@""])
    {
        statement = [NSString stringWithFormat:@"select * from %@ where %@",tableName, constraint];
    }
    else
    {
        statement = [NSString stringWithFormat:@"select * from %@",tableName];
    }
    
    const char *charStatement = [statement cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *results;
    if (sqlite3_prepare_v2(database, charStatement, -1, &results, NULL)== SQLITE_OK)
    {
        while (sqlite3_step(results) == SQLITE_ROW)
        {
            
            NSInteger itemID =  sqlite3_column_int(results, 0);
            char *charItemName =  (char *)sqlite3_column_text(results, 1);
            NSString *itemName = [NSString stringWithUTF8String:charItemName];
#warning fertig implementieren und setter bauen
            NSLog(@"ItemName: %@",itemName);
        }
    }
    
    
    sqlite3_close(database);
    return mutableItemArray;
}


@end
