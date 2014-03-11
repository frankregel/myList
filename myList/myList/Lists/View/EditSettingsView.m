//
//  EditSettingsView.m
//  myList
//
//  Created by Frank on 03.03.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "EditSettingsView.h"
#import <QuartzCore/QuartzCore.h>


@interface EditSettingsView ()

@property UILabel *colorLabel;
@property UIImage *colorImage;
@property UILabel *pictureLabel;
@property UILabel *cameraLabel;
@property UIView *color;
@property UIView *camera;
@property UIImageView *cameraIcon;
@property UIImage *camImage;
@property UIImageView *colorView;


@end

@implementation EditSettingsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addColorLabel];
        [self addCamLabel];
        // Initialization code
    }
    return self;
}

- (void)addColorLabel
{
    _color = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 310, 44)];
    _colorView = [[UIImageView alloc]initWithFrame:CGRectMake(265, 5, 34, 34)];
    _colorView.image = [UIImage imageNamed:@"color"];
    _colorLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0 , 200, 44)];
    _colorLabel.text = NSLocalizedString(@"ButtonColor", nil);
    
    _color.layer.borderColor = [[UIColor grayColor] CGColor];
    _color.layer.borderWidth = 1;
    _color.layer.cornerRadius = 2;
    
    [_color addSubview:_colorLabel];
    [_color addSubview:_colorView];
    
    [self addSubview:_color];
    
}

- (void)addCamLabel
{
    _camera = [[UIView alloc]initWithFrame:CGRectMake(0, 50, 310, 44)];
    _cameraIcon = [[UIImageView alloc]initWithFrame:CGRectMake(265, 5, 34, 34)];
#warning hier noch die Cam einfügen als System Item
    _cameraLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 200, 44)];
    _cameraLabel.text = NSLocalizedString(@"BackgroundPicture", nil);
    
    _camera.layer.borderColor = [[UIColor grayColor] CGColor];
    _camera.layer.borderWidth = 1;
    _camera.layer.cornerRadius = 2;
    
    [_camera addSubview:_cameraIcon];
    [_camera addSubview:_cameraLabel];
    
    [self addSubview:_camera];
    
}

- (void)ChangeColorTo:(UIColor *)newColor
{
#warning colorpicker bauen
}

- (void)didCallCam
{
#warning cam implementieren
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
