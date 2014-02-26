//
//  EditMetaDataView.m
//  myList
//
//  Created by Frank Regel on 26.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "EditMetaDataView.h"
#import <QuartzCore/QuartzCore.h>

@implementation EditMetaDataView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UITextField *newTitle = [[UITextField alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, 44)];
        [newTitle setTextColor:[UIColor blackColor]];
        newTitle.placeholder = @"neue Liste";
        [self addSubview:newTitle];
        newTitle.layer.borderColor = [[UIColor grayColor] CGColor];
        newTitle.layer.borderWidth = 2;
        newTitle.layer.cornerRadius = 5;
        
    }
    return self;
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
