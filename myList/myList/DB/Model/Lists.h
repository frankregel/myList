//
//  Lists.h
//  myList
//
//  Created by Frank Regel on 26.03.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Items;

@interface Lists : NSManagedObject

@property (nonatomic, retain) NSString * backgroundimage;
@property (nonatomic, retain) NSString * buttoncolor;
@property (nonatomic, retain) NSString * listname;
@property (nonatomic, retain) NSSet *itemrelation;
@end

@interface Lists (CoreDataGeneratedAccessors)

- (void)addItemrelationObject:(Items *)value;
- (void)removeItemrelationObject:(Items *)value;
- (void)addItemrelation:(NSSet *)values;
- (void)removeItemrelation:(NSSet *)values;

@end
