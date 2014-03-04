//
//  EditMetaDataView.m
//  myList
//
//  Created by Frank Regel on 26.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "EditMetaDataView.h"
#import <QuartzCore/QuartzCore.h>

@interface EditMetaDataView ()

@property UITextField *title;
@property UIButton *country;
@property UIButton *region;
@property UIButton *city;
@property NSArray *countries;
@property NSString *currentCountry;
@property UILabel *countryLabel;


@end

@implementation EditMetaDataView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _countries = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"countries" ofType:@"plist"]];
        [self addTextfieldWithName:@" neue Liste"];
        [self addCountryPicker];
        [self addRegionPicker];
        [self addCityPicker];
        
    }
    return self;
}


- (void)addTextfieldWithName:(NSString *)listName
{
    _title = [[UITextField alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, 44)];
    [_title setTextColor:[UIColor blackColor]];
    
    _title.placeholder = listName;
#warning wie richtet man das ordentlich aus?
    _title.layer.borderColor = [[UIColor grayColor] CGColor];
    _title.layer.borderWidth = 1;
    _title.layer.cornerRadius = 5;
    [self addSubview:_title];
}

- (void)addCountryPicker
{
    _country = [[UIButton alloc]initWithFrame:CGRectMake(0,70 , self.frame.size.width, 44)];
    [_country setTitle:@"Land" forState:UIControlStateNormal];
    [_country setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _country.layer.borderColor = [[UIColor grayColor] CGColor];
    _country.layer.borderWidth = 1;
    _country.layer.cornerRadius = 2;
    [self addSubview:_country];
    
}

- (void)addRegionPicker
{
    _region = [[UIButton alloc]initWithFrame:CGRectMake(0,120  , self.frame.size.width, 44)];
    [_region setTitle:@"Region" forState:UIControlStateNormal];
    [_region setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _region.layer.borderColor = [[UIColor grayColor] CGColor];
    _region.layer.borderWidth = 1;
    _region.layer.cornerRadius = 2;
    [self addSubview:_region];
}

- (void)addCityPicker
{
    _city = [[UIButton alloc]initWithFrame:CGRectMake(0,170 , self.frame.size.width, 44)];
    [_city setTitle:@"Stadt" forState:UIControlStateNormal];
    [_city setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _city.layer.borderColor = [[UIColor grayColor] CGColor];
    _city.layer.borderWidth = 1;
    _city.layer.cornerRadius = 2;
    [self addSubview:_city];
}


#warning vorbereitet für Mittwoch
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _currentCountry = [[self.countries objectAtIndex:row] objectForKey:@"code"];
    _countryLabel.text = [[self.countries objectAtIndex:row] objectForKey:@"name"];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _countries.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[_countries objectAtIndex:row] objectForKey:@"name"];
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
