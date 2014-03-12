//
//  DataSourceManager.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "DataSourceManager.h"
#import "DatabaseManager.h"
#import "ListModel.h"
#import "RecModel.h"
#import "ItemModel.h"

@interface DataSourceManager ()
@property NSArray *listArray;
@property NSArray *recArray;
@property NSArray *itemArray;
@property NSArray *postArray;
@property NSMutableArray *mutableImageArray;
@property NSMutableDictionary *mutableListDict;
@property NSString *timeStampString;
@property NSDictionary *tmpDict;

@end

@implementation DataSourceManager

- (id)init
{
    self = [super init];
    if (self)
    {
        [self setTestData];
        
    }
    return self;
}

- (void)setTestData
{
    ListModel *firstList = [ListModel new];
    [firstList setListName:@"Erste Liste"];
    
    ListModel *secondList = [ListModel new];
    [secondList setListName:@"Zweite Liste"];
    
    ListModel *thirdList = [ListModel new];
    [thirdList setListName:@"Dritte Liste"];
    
    _listArray = @[firstList,secondList,thirdList];
    
    RecModel *firstRec = [RecModel new];
    firstRec.recName = @"Erste Rec";
    RecModel *secondRec = [RecModel new];
    secondRec.recName = @"Zweite Rec";
    
    _recArray = @[firstRec, secondRec];
    
    ItemModel *firstItem = [ItemModel new];
    [firstItem setItemName:@"1st Item"];
    [firstItem setIsRecItemTo:YES];
    ItemModel *secondItem = [ItemModel new];
    [secondItem setItemName:@"2nd Item"];
    ItemModel *thirdItem = [ItemModel new];
    [thirdItem setIsRecItemTo:YES];
    [thirdItem setItemName:@"3rd Item"];
    ItemModel *fourthItem = [ItemModel new];
    [fourthItem setItemName:@"4th Item"];
    
    _itemArray = @[firstItem,secondItem,thirdItem,fourthItem];
    
    [firstList setListItems:_itemArray];
    [secondList setListItems:@[secondItem,thirdItem,fourthItem]];
    [thirdList setListItems:@[thirdItem,fourthItem]];
    
    //Dem RecDetailview nur Items geben die das Flag isRecItem haben
    NSMutableArray *tmpArray = [NSMutableArray new];
    
    for (ItemModel *tmp in _itemArray)
    {
        if ([tmp getIsRecItem] == YES)
        {
            [tmpArray addObject:tmp];
        }
    }
    
    [firstRec setRecItems:tmpArray];
    
    DatabaseManager *manager = [DatabaseManager new];
    [manager getItemsFromDatabaseWithName:@"myList.db" fromTable:@"items" andConstraint:@""];
    
    
    
}

- (NSArray *)getLists
{
    return _listArray;
}

- (NSArray *)getRecList
{
    return _recArray;
}

- (NSArray *)getItems
{
    return _itemArray;
}

#pragma mark - Shared Instance aka Singleton
+ (DataSourceManager *)useDataMethod
{
    static DataSourceManager *_useDataMethod = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _useDataMethod = [self new];
    });
    return _useDataMethod;
}

#pragma mark - Daten in eine Datei schreiben bzw lesen und Notification senden
- (void)saveItemToFileWith:(NSString *)newItem andTimeStamp:(NSString *)uniqueTimeStamp
{
    _timeStampString = uniqueTimeStamp;
    [_mutableListDict setObject:newItem forKey:_timeStampString];
    
    //Datenweg
    NSString *documentsDirectory  = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *txtFile = [documentsDirectory stringByAppendingPathComponent:@"myList.txt"];
    
    [_mutableListDict writeToFile:txtFile atomically:YES];
    //Es wird bekannt gegeben, das sich was getan hat und alle die sich registriert haben sollen loslegen
    //[[NSNotificationCenter defaultCenter]postNotificationName:BDANotification_notesUpdated object:self userInfo:_mutableTextInputDict];
    //hier keine langen Berechnungen anstellen. Notofications gehen erst raus wenn Kapazität frei ist.
    
    
}

- (NSDictionary *)loadListDict
{
    NSString *documentsDirectory  = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *txtFile = [documentsDirectory stringByAppendingPathComponent:@"myList.txt"];
    _tmpDict = [[NSDictionary alloc]initWithContentsOfFile:txtFile];
    
    if (_tmpDict)
    {
        
        [_mutableListDict addEntriesFromDictionary:_tmpDict];
    }
    return _tmpDict;
}


#pragma mark - Daten aus dem Netz holen (JSON)
-(NSArray*)loadDataFromWanWith:(NSString*)quellURL and:(NSString*)keyForObject
{
    //URL benennen
    NSURL *tmpUrl = [NSURL URLWithString:quellURL];
    //NSData die Daten der Quelle übergeben
    NSData *quellData = [NSData dataWithContentsOfURL:tmpUrl];
    //NSData in ein Dictionary umwandeln
    NSDictionary *dictionaryJSON = [NSJSONSerialization JSONObjectWithData:quellData
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:nil];
    //ERgebnisse ins Array schreiben
    _postArray = [dictionaryJSON objectForKey:keyForObject];
    
    
    return _postArray;
}

-(NSMutableArray*) getPicsFromWanWith:(NSString*)stringForKey inPostArray:(NSArray*)thumbNailArray
{
    _mutableImageArray = [NSMutableArray new];
    
    for (NSDictionary *tmpDict in thumbNailArray)
    {
        NSString *thumbnailString =[tmpDict objectForKey:stringForKey];
        NSURL *thumbnailURL =[NSURL URLWithString:thumbnailString];
        NSData *tmpImageData = [NSData dataWithContentsOfURL:thumbnailURL];
        UIImage *tmpImage = [UIImage imageWithData:tmpImageData];
        [_mutableImageArray addObject:tmpImage];
        
    }
    return _mutableImageArray;
}

@end
