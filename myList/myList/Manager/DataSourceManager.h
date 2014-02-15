//
//  DataSourceManager.h
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataSourceManager : NSObject

+ (DataSourceManager *)sharedInstance;

- (NSArray *)getLists;

@end
