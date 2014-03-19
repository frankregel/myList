//
//  ListModel.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "ListModel.h"
@interface ListModel ()

@property (nonatomic)  NSInteger listID;
@property (nonatomic)  NSString *listName;
@property (nonatomic)  NSString *countryName;
@property (nonatomic)  NSString *regionName;
@property (nonatomic)  NSString *cityName;
@property (nonatomic)  NSArray *listItems;
@property (nonatomic)  BOOL isPublic;
@property (nonatomic)  NSString *buttonColor;
@property (nonatomic)  NSString *backGroundImageString;

@end

@implementation ListModel

- (void)setListID:(NSInteger)listID
{
    _listID = listID;
}

- (NSInteger)getListID
{
    return _listID;
}

- (void)setListName:(NSString *)listName
{
    _listName = listName;
}

- (NSString *)getListName
{
    return _listName;
}

- (void)setCountry:(NSString *)countryName
{
    _countryName = countryName;
}

- (NSString *)getCountryName
{
    return _countryName;
}

- (void)setRegionName:(NSString *)regionName
{
    _regionName = regionName;
}

- (NSString *)getRegionName
{
    return _regionName;
}

- (void)setCityName:(NSString *)cityName
{
    _cityName = cityName;
}

- (NSString *)getCityName
{
    return _cityName;
}

- (void)setListItems:(NSArray *)listItems
{
    _listItems = [[NSArray alloc] initWithArray:listItems];
}

- (NSArray *)getListItems
{
    return _listItems;
}

- (void)setIsPublic:(BOOL)isPublic
{
    _isPublic = isPublic;
}

- (BOOL)getIsPublic
{
    return _isPublic;
}

- (void)setButtonColor:(NSString *)buttonColor
{
    _buttonColor = buttonColor;
}

- (NSString *)getButtonColor
{
    return _buttonColor;
}

- (void)setBackGroundImageString:(NSString *)backGroundImageString
{
    _backGroundImageString = backGroundImageString;
}

- (NSString *)getBackGroundImageString
{
    return _backGroundImageString;
}


@end
