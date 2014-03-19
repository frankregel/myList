//
//  ListModel.h
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject

- (void)setListID:(NSInteger)listID;

- (NSInteger)getListID;

- (void)setListName:(NSString *)listName;

- (void)setCountry:(NSString *)countryName;

- (NSString *)getCountryName;

- (void)setRegionName:(NSString *)regionName;

- (NSString *)getRegionName;

- (void)setCityName:(NSString *)cityName;

- (NSString *)getCityName;

- (NSString *)getListName;

- (void)setListItems:(NSArray *)listItems;

- (NSArray *)getListItems;

- (void)setIsPublic:(BOOL)isPublic;

- (BOOL)getIsPublic;

- (void)setButtonColor:(NSString *)buttonColor;

- (NSString *)getButtonColor;

- (void)setBackGroundImageString:(NSString *)backGroundImageString;

- (NSString *)getBackGroundImageString;

@end
