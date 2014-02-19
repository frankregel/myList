//
//  RecModel.h
//  myList
//
//  Created by Frank Regel on 19.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecModel : NSObject

@property (nonatomic)  NSString *recName;
@property (nonatomic)  NSArray *recItems;

- (NSString *)getRecName;

- (NSArray *)getRecItems;

@end
