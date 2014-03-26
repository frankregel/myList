//
//  CoreDataManager.m
//  myList
//
//  Created by Frank Regel on 26.03.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "CoreDataManager.h"
#import "AppDelegate.h"
#import "Lists.h"
#import "Items.h"
#import "Lists+Additions.h"

@interface CoreDataManager()

@property NSManagedObjectContext *myContext;

@end

@implementation CoreDataManager

+ (CoreDataManager *)coreDataInstance
{
    //define, that sharedInstance exist exact 1 time
    static CoreDataManager *_coreDataInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _coreDataInstance = [self new];
    });
    return _coreDataInstance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        AppDelegate *myAppDelegate = [[UIApplication sharedApplication]delegate];
        _myContext = myAppDelegate.managedObjectContext;
        //[self createTestData];
    }
    return self;
}

//- (void)createTestData
//{
//    NSEntityDescription *desciption = [NSEntityDescription entityForName:@"Lists" inManagedObjectContext:nil];
//    Lists *testList = [[Lists alloc]initWithEntity:desciption insertIntoManagedObjectContext:nil];
//    testList.listname = @"newTestList";
//    Lists *testList2 = [Lists new];
//    [testList2 setNewListname:@"Zweite Liste"];
//    
//    [self saveList:testList];
//    [self saveList:testList2];
//}

- (void)saveItem:(NSArray *)itemObjectArray
{
    for (Items *tmpItem in itemObjectArray)
    {
        Items *saveItem = [NSEntityDescription insertNewObjectForEntityForName:@"Items" inManagedObjectContext:_myContext];
        saveItem.itemname = tmpItem.itemname;
        saveItem.itemdescription = tmpItem.itemdescription;
    }
    
    NSError *error = nil;
    [_myContext save:&error];
}

- (void)saveList:(Lists *)listObject
{
    Lists *saveList = [NSEntityDescription insertNewObjectForEntityForName:@"Lists" inManagedObjectContext:_myContext];
    saveList.listname = listObject.listname;
    saveList.backgroundimage = listObject.backgroundimage;
    saveList.buttoncolor = listObject.buttoncolor;
    
    NSError *error = nil;
    [_myContext save:&error];
}

- (NSArray *)loadListArray
{
    NSFetchRequest *fetchRequestForLists = [[NSFetchRequest alloc] initWithEntityName:@"Lists"];
    NSError *error = nil;
    NSArray *resultArray = [_myContext executeFetchRequest:fetchRequestForLists error:&error];
    
    return resultArray;
}

@end
