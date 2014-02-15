//
//  DataSourceManager.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "DataSourceManager.h"
#import "ListModel.h"

@interface DataSourceManager ()
@property NSArray *listArray;

@end

@implementation DataSourceManager

- (id)init
{
    self = [super init];
    if (self)
    {
        ListModel *firstList = [ListModel new];
        [firstList setListName:@"Erste Liste"];
        
        ListModel *secondList = [ListModel new];
        [secondList setListName:@"Zweite Liste"];
        
        ListModel *thirdList = [ListModel new];
        [thirdList setListName:@"Dritte Liste"];
        
        _listArray = @[firstList,secondList,thirdList];
        
    }
    return self;
}

+ (DataSourceManager *)sharedInstance
{
    //define, that sharedInstance exist exact 1 time
    static DataSourceManager *_sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [self new];
    });
    return _sharedInstance;
}

- (NSArray *)getLists
{
    return _listArray;
}



@end
