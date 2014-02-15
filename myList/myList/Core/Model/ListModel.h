//
//  ListModel.h
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject


- (void)setListName:(NSString *)listName;

- (NSString *)getListName;

- (void)setListItems:(NSArray *)listItems;

- (NSArray *)getListItems;

- (void)setIsPublic:(BOOL)isPublic;

- (BOOL)getIsPublic;

- (void)setButtonColor:(UIColor *)buttonColor;

- (UIColor *)getButtonColor;

- (void)setBackGroundImageString:(NSString *)backGroundImageString;

- (NSString *)getBackGroundImageString;

@end
