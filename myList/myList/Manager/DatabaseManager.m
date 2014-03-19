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
#import "ListModel.h"

@interface DatabaseManager ()
@property NSMutableArray *mutableItemArray;
@property NSMutableArray *mutableListArray;
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

#pragma mark - Datenbank vorbereiten
- (NSString *)setupDatabase:(NSString *)databaseName
{
    NSString *documentsDirectory  = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:databaseName];
    
    if ([[NSFileManager defaultManager]contentsAtPath:databasePath]==nil)
    {
        NSString *absolutePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:databaseName];
        NSData *dbData = [[NSData alloc]initWithContentsOfFile:absolutePath];
        [dbData writeToFile:databasePath atomically:YES];
    }
    return databasePath;
    
    //[_mutableListDict writeToFile:txtFile atomically:YES];
}

#pragma mark - getter und setter für die DB

- (NSMutableArray *)getItemsFromDatabaseWithName:(NSString *)databaseName fromTable:(NSString *)tableName andConstraint:(NSString *)constraint
{
    
    NSString *absolutePath = [self setupDatabase:databaseName];
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

- (NSMutableArray *)getListsFromDatabaseWithName:(NSString *)databaseName fromTable:(NSString *)tableName andConstraint:(NSString *)constraint
{
    
    NSString *absolutePath = [self setupDatabase:databaseName];
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
    _mutableListArray = [NSMutableArray new];
    
    
    if (sqlite3_prepare_v2(_database, _charStatement, -1, &results, NULL)== SQLITE_OK)
    {
        while (sqlite3_step(results) == SQLITE_ROW)
        {
            //new ItemModel
            ListModel *tmpList = [ListModel new];
            
            
            [tmpList setListID:sqlite3_column_int(results, 0)];
            
            const char *tmpValue = (char *)sqlite3_column_text(results, 1);
            [tmpList setListName:[NSString stringWithUTF8String:tmpValue]];
            
            tmpValue = (char *)sqlite3_column_text(results, 2);
            [tmpList setCountry:[NSString stringWithUTF8String:tmpValue]];
            
            tmpValue = (char *)sqlite3_column_text(results, 3);
            [tmpList setRegionName:[NSString stringWithUTF8String:tmpValue]];
            
            tmpValue = (char *)sqlite3_column_text(results, 4);
            [tmpList setCityName:[NSString stringWithUTF8String:tmpValue]];
            
            tmpValue = (char *)sqlite3_column_text(results, 5);
            [tmpList setButtonColor:[NSString stringWithUTF8String:tmpValue]];
            
            tmpValue = (char *)sqlite3_column_text(results, 6);
            [tmpList setBackGroundImageString:[NSString stringWithUTF8String:tmpValue]];
            
            [_mutableItemArray addObject:tmpList];

        }
    }
    sqlite3_close(_database);
    
    return _mutableListArray;
}


- (void)addItemsToDatabaseWithName:(NSString *)databaseName inTable:(NSString *)tableName whithItem:(NSArray *)newItemArray
{
    
    NSString *absolutePath = [self setupDatabase:databaseName];
    NSLog(@"Absoluter Pfad: %@", absolutePath);
    
    //Datenbank öffnen --- "**" bedeuten "&" verwenden
    sqlite3_open([absolutePath UTF8String], &_database);
    
        sqlite3_stmt *statement;
    
        ItemModel *tmp;
        for (tmp in newItemArray)
        {
            NSString *stringDate = [_dateFormat stringFromDate:[tmp getItemYear]];
            
            _statement = [NSString stringWithFormat:@"insert into %@ VALUES (%@,\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",tableName,[tmp getItemID],[tmp getItemName],[tmp getItemDescription],stringDate,[tmp getItemRecommendedBy],[tmp getItemImage]];
            
            _charStatement = [_statement cStringUsingEncoding:NSUTF8StringEncoding];
            
            if (sqlite3_prepare_v2(_database, _charStatement, -1, &statement, NULL)!= SQLITE_OK)
            {
                NSLog(@"Verbindung steht nicht");
            }
            
        }
    sqlite3_close(_database);
}

- (void)addListToDatabaseWithName:(NSString *)databaseName inTable:(NSString *)tableName whithList:(ListModel *)newList
{
    
    NSString *absolutePath = [self setupDatabase:databaseName];
    NSLog(@"Absoluter Pfad: %@", absolutePath);
    
    //Datenbank öffnen --- "**" bedeuten "&" verwenden
    sqlite3_open([absolutePath UTF8String], &_database);
    
    sqlite3_stmt *statement;
    
        _statement = [NSString stringWithFormat:@"insert into %@ (list_name,list_country,list_region,list_city,list_buttoncolor,list_image) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",tableName,[newList getListName],[newList getCountryName],[newList getRegionName],[newList getCityName],[newList getButtonColor],[newList getBackGroundImageString]];
        
        
        _charStatement = [_statement cStringUsingEncoding:NSUTF8StringEncoding];
        
        if (sqlite3_prepare_v2(_database, _charStatement, -1, &statement, NULL)!= SQLITE_OK)
        {
            NSLog(@"Verbindung steht nicht");
        }
    
    sqlite3_close(_database);
}

@end
