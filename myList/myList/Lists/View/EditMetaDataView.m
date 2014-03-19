//
//  EditMetaDataView.m
//  myList
//
//  Created by Frank Regel on 26.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "EditMetaDataView.h"
#import <QuartzCore/QuartzCore.h>
#import "customTextfield.h"
#import "BasePickerView.h"
#import "EditSettingsView.h"

@interface EditMetaDataView ()

@property UIButton *country;
@property NSArray *countries;
@property BasePickerView *basePicker;
@property EditSettingsView *settingsView;


@end

@implementation EditMetaDataView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //Sourcefile für die Länderliste angeben
        _countries = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"countries" ofType:@"plist"]];
        
        
        
        [self addTextfieldWithName:NSLocalizedString(@"NewList", nil)];
        [self addCountryPicker];
        [self addRegionPicker];
        [self addCityPicker];
        _basePicker = [[BasePickerView alloc] initWithFrame:CGRectMake(0, 70, 320, 180)];
        _basePicker.hidden = YES;
        [self addSubview:_basePicker];
        //[_basePicker addTarget:self action:@selector(setCountryString:)];
        //SAG BESCHEID DASS DU EMPÄNGST
        _basePicker.empfaenger = self;
        
        //[_basePicker setEmpfaenger:self];
        
        //settings View aufrufen
        _settingsView = [[EditSettingsView alloc]initWithFrame:CGRectMake(0, 270, 320, 200)];
        [self addSubview:_settingsView];
        
    }
    return self;
}

- (void)didTouchRightButton:(NSString *)currentValue
{
    [self setCountryString:currentValue];
}

- (void)setCountryString:(NSString *)countryString
{
    _countryString = countryString;
    [_country setTitle:countryString forState:UIControlStateNormal];
    _basePicker.hidden = YES;
}

- (void)callCountryPicker
{
    [_basePicker setDatasourceWith:_countries];
    _basePicker.hidden = NO;
}

- (void)addTextfieldWithName:(NSString *)listName
{
    
    _title = [[customTextfield alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, 44)];
    [_title setTextColor:[UIColor blackColor]];
    
    _title.placeholder = listName;
    _title.layer.borderColor = [[UIColor grayColor] CGColor];
    _title.layer.borderWidth = 1;
    _title.layer.cornerRadius = 5;
    [self addSubview:_title];
}

- (void)addCountryPicker
{
    _country = [[UIButton alloc]initWithFrame:CGRectMake(0,70 , self.frame.size.width, 44)];
    [_country setTitle:NSLocalizedString(@"Country", nil) forState:UIControlStateNormal];
    [_country setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_country addTarget:self action:@selector(callCountryPicker) forControlEvents:UIControlEventTouchUpInside];
    _country.layer.borderColor = [[UIColor grayColor] CGColor];
    _country.layer.borderWidth = 1;
    _country.layer.cornerRadius = 2;
    [self addSubview:_country];
    
}

- (void)addRegionPicker
{
    _region = [[customTextfield alloc]initWithFrame:CGRectMake(0,120  , self.frame.size.width, 44)];
    [_region setTextColor:[UIColor blackColor]];
    _region.placeholder = NSLocalizedString(@"Region", nil);
    _region.layer.borderColor = [[UIColor grayColor] CGColor];
    _region.layer.borderWidth = 1;
    _region.layer.cornerRadius = 2;
    [self addSubview:_region];
}

- (void)addCityPicker
{
    _city = [[customTextfield alloc]initWithFrame:CGRectMake(0,170 , self.frame.size.width, 44)];
    [_city setTextColor:[UIColor grayColor]];
    _city.placeholder = NSLocalizedString(@"City", nil);
    _city.layer.borderColor = [[UIColor grayColor] CGColor];
    _city.layer.borderWidth = 1;
    _city.layer.cornerRadius = 2;
    [self addSubview:_city];
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
