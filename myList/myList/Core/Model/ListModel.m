//
//  ListModel.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "ListModel.h"
@interface ListModel ()

@property (nonatomic)  NSString *listName;
@property (nonatomic)  NSArray *listItems;
@property (nonatomic)  BOOL isPublic;
@property (nonatomic)  UIColor *buttonColor;
@property (nonatomic)  NSString *backGroundImageString;

@end

@implementation ListModel

- (void)setListName:(NSString *)listName
{
    _listName = listName;
}

- (NSString *)getListName
{
    return _listName;
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

- (void)setButtonColor:(UIColor *)buttonColor
{
    _buttonColor = buttonColor;
}

- (UIColor *)getButtonColor
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
