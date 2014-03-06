//
//  EditMetaDataView.h
//  myList
//
//  Created by Frank Regel on 26.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePickerView.h"

@interface EditMetaDataView : UIView <BasePickerProtocol>

- (void) setCountryString:(NSString *)countryString;

@end
