//
//  TableHeaderView.h
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableHeaderView : UIView

- (void)setImageWith:(NSString *)imageNameString andName:(NSString *)labelNameString;
- (void)setHeaderStyleWithBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor andCornerRadius:(CGFloat)cornerRadius andHeaderName:(NSString *)headerName;
@end
