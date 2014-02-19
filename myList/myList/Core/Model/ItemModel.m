//
//  ItemModel.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "ItemModel.h"

@interface ItemModel ()

@property (nonatomic) NSString *itemName;
@property (nonatomic) NSString *itemDescription;
@property (nonatomic) NSDate *itemYear;
@property (nonatomic) NSString *itemRecommendedBy;
@property (nonatomic) NSString *itemImage;

#warning und wie macht man das mit Image?

@end

@implementation ItemModel


- (void)setItemName:(NSString *)itemName
{
    _itemName = itemName;
}

- (NSString *)getItemName
{
    return _itemName;
}

- (void)setItemDescription:(NSString *)itemDescription
{
    _itemDescription = itemDescription;
}

- (NSString *)getItemDescription
{
    return _itemDescription;
}

- (void)setItemYear:(NSDate *)itemYear
{
    _itemYear = itemYear;
}

- (NSDate *)getItemYear
{
    return _itemYear;
}

- (void)setItemRecommendedBy:(NSString *)itemRecommendedBy
{
    _itemRecommendedBy = itemRecommendedBy;
}

- (NSString *)getItemRecommendedBy
{
    return _itemRecommendedBy;
}

- (void)setItemImage:(NSString *)itemImage
{
    _itemImage = itemImage;
}

- (NSString *)getItemImage
{
    return _itemImage;
}

@end
