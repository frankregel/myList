//
//  DatabaseManager.m
//  myList
//
//  Created by Frank Regel on 12.03.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "DatabaseManager.h"
#import <sqlite3.h>
#import "ItemModel.h"

@interface DatabaseManager ()
@property NSMutableArray *mutableItemArray;
@property sqlite3 *database;
@property NSString *statement;

@property NSDateFormatter *dateFormat;

@property const char *charItemID;
@property const char *charStatement;
@property const char *charItemName;
@property const char *charItemDescription;
@property const char *charItemYear;
@property const char *charItemRecommendedBy;
@property const char *charItemImage;




@end

@implementation DatabaseManager

- (id)init
{
    self = [super init];
    if (self)
    {
        _dateFormat = [NSDateFormatter new];
        [_dateFormat setDateFormat:@"yyyy"];
    }
    return self;
}

#pragma mark - getter und setter für die DB

- (NSMutableArray *)getItemsFromDatabaseWithName:(NSString *)databaseName fromTable:(NSString *)tableName andConstraint:(NSString *)constraint
{
    NSString *absolutePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:databaseName];
    NSLog(@"%@", absolutePath);
    
    //Datenbank öffnen --- "**" bedeuten "&" verwenden
    sqlite3_open([absolutePath UTF8String], &_database);
    
    //check if there is a constraint and if not take 2nd statement
    if (![constraint isEqualToString:@""])
    {
        _statement = [NSString stringWithFormat:@"select * from %@ where %@",tableName, constraint];
    }
    else
    {
        _statement = [NSString stringWithFormat:@"select * from %@",tableName];
    }
    
    _charStatement = [_statement cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *results;
    //new array to return values
    _mutableItemArray = [NSMutableArray new];

    
    if (sqlite3_prepare_v2(_database, _charStatement, -1, &results, NULL)== SQLITE_OK)
    {
        while (sqlite3_step(results) == SQLITE_ROW)
        {
            //new ItemModel
            ItemModel *tmpItem = [ItemModel new];
            
            _charItemName =  (char *)sqlite3_column_text(results, 1);
            [tmpItem setItemName:[NSString stringWithUTF8String:_charItemName]];
            
            _charItemDescription = (char *)sqlite3_column_text(results, 2);
            [tmpItem setItemDescription:[NSString stringWithUTF8String:_charItemDescription]];
            
            _charItemYear = (char *)sqlite3_column_text(results, 3);
            [tmpItem setItemYear:[_dateFormat dateFromString:[NSString stringWithUTF8String:_charItemYear]]];
            
            _charItemRecommendedBy = (char *)sqlite3_column_text(results, 4);
            [tmpItem setItemRecommendedBy:[NSString stringWithUTF8String:_charItemRecommendedBy]];
            
            _charItemImage = (char *)sqlite3_column_text(results, 5);
            [tmpItem setItemImage:[NSString stringWithUTF8String:_charItemImage]];
            
            
            [_mutableItemArray addObject:tmpItem];
            
            NSLog(@"ItemName: %@",[tmpItem getItemName]);
            NSLog(@"ItemName: %@",[tmpItem getItemDescription]);
        }
    }
    sqlite3_close(_database);

    return _mutableItemArray;
}

- (NSMutableArray *)addItemsToDatabaseWithName:(NSString *)databaseName inTable:(NSString *)tableName whithItem:(NSArray *)newItemArray
{
    
    NSString *absolutePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:databaseName];
    NSLog(@"%@", absolutePath);
    
    //Datenbank öffnen --- "**" bedeuten "&" verwenden
    sqlite3_open([absolutePath UTF8String], &_database);
    
        sqlite3_stmt *statement;
    
        ItemModel *tmp = [ItemModel new];
        for (tmp in newItemArray)
        {
            _charItemID = [[tmp getItemID]UTF8String];
            _charItemName = [[tmp getItemName]UTF8String];
            _charItemDescription = [[tmp getItemDescription]UTF8String];
            NSString *stringDate = [_dateFormat stringFromDate:[tmp getItemYear]];
            _charItemYear = [stringDate UTF8String];
            _charItemRecommendedBy = [[tmp getItemRecommendedBy]UTF8String];
            _charItemImage = [[tmp getItemImage]UTF8String];
            
            
            _statement = [NSString stringWithFormat:@"insert into %@.%@ VALUES (%s,%s,%s,%s,%s,%s)",_database,tableName, _charItemID,_charItemName,_charItemDescription,_charItemYear,_charItemRecommendedBy,_charItemImage];
            
            _charStatement = [_statement cStringUsingEncoding:NSUTF8StringEncoding];
            sqlite3_prepare_v2(_database, _charStatement, -1, &statement, NULL);
            
#warning totaler Schrott
            
            
            
        }
    
    

   
    
    return _mutableItemArray;
}

@end
