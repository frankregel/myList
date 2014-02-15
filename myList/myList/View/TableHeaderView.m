//
//  TableHeaderView.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "TableHeaderView.h"

@interface TableHeaderView ()

@property UIImageView *tableHeaderImageView;
@property UILabel *tableHeaderLabel;

@end

@implementation TableHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _tableHeaderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [self addSubview:_tableHeaderImageView];
        _tableHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 270, 40)];
        [self addSubview:_tableHeaderLabel];
        self.alpha = 0.5;
        // Initialization code
    }
    return self;
}

- (void)setImageWith:(NSString *)imageNameString andName:(NSString *)labelNameString
{
    UIImage *tmpImage = [UIImage imageNamed:imageNameString];
    [_tableHeaderImageView setImage:tmpImage];
    [_tableHeaderLabel setText:labelNameString];
    
    
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
