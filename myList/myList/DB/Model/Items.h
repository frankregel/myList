//
//  Items.h
//  myList
//
//  Created by Frank Regel on 26.03.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Items : NSManagedObject

@property (nonatomic, retain) NSNumber * isrecitem;
@property (nonatomic, retain) NSString * itemdescription;
@property (nonatomic, retain) NSString * itemimage;
@property (nonatomic, retain) NSString * itemname;
@property (nonatomic, retain) NSString * itemrecommendedby;
@property (nonatomic, retain) NSDate * itemyear;
@property (nonatomic, retain) NSSet *listrelation;
@end

@interface Items (CoreDataGeneratedAccessors)

- (void)addListrelationObject:(NSManagedObject *)value;
- (void)removeListrelationObject:(NSManagedObject *)value;
- (void)addListrelation:(NSSet *)values;
- (void)removeListrelation:(NSSet *)values;

@end
