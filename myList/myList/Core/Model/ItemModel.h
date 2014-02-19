//
//  ItemModel.h
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject

- (void)setItemName:(NSString *)itemName;

- (NSString *)getItemName;

- (void)setItemDescription:(NSString *)itemDescription;

- (NSString *)getItemDescription;

- (void)setItemYear:(NSDate *)itemYear;

- (NSDate *)getItemYear;

- (void)setItemRecommendedBy:(NSString *)itemRecommendedBy;

- (NSString *)getItemRecommendedBy;

- (void)setItemImage:(NSString *)itemImage;

- (NSString *)getItemImage;

@end
