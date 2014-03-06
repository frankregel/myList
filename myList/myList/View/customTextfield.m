//
//  customTextfield.m
//  myList
//
//  Created by Frank Regel on 05.03.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "customTextfield.h"

@implementation customTextfield

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 5, 5);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 5, 5);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
