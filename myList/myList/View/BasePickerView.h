//
//  BasePickerView.h
//  myList
//
//  Created by Frank Regel on 05.03.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BasePickerProtocol <NSObject>


- (void)didTouchRightButton:(NSString *)currentValue;

@end

@interface BasePickerView : UIView 

@property id <BasePickerProtocol> empfaenger;

- (void)setDatasourceWith:(NSArray *)dataArray;
- (void)addTarget:(id)target action:(SEL)action;

@end
