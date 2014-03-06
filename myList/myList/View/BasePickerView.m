//
//  BasePickerView.m
//  myList
//
//  Created by Frank Regel on 05.03.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "BasePickerView.h"
#import "EditMetaDataView.h"

@interface BasePickerView () <UIPickerViewDelegate, UIPickerViewDataSource>

@property NSArray *valueArray;
@property NSString *currentValue;
@property id target;
@property SEL action;
@property UIPickerView *basePicker;


@end

@implementation BasePickerView 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        _basePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 0, 300, 120)];
        _basePicker.dataSource = self;
        _basePicker.delegate = self;
        
        [self addSubview:_basePicker];
        UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 60, 44)];
        [leftButton setTitle:@"Abbrechen" forState:UIControlStateNormal];
        [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:leftButton];
        [leftButton addTarget:self action:@selector(cancelValue) forControlEvents:UIControlEventTouchUpInside];
        UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width -70 , 0, 60, 44)];
        [rightButton addTarget:self action:@selector(confirmValue) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setTitle:@"OK" forState:UIControlStateNormal];
        [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:rightButton];

    }
    return self;
}

- (void)cancelValue
{
    self.hidden = YES;
}

- (void)confirmValue
{
    if (_target)
    {
        [_target performSelector:_action withObject:_currentValue];
    }
    if (_empfaenger)
    {
        [_empfaenger didTouchRightButton:_currentValue];
    }
}

- (void)addTarget:(id)target action:(SEL)action
{
    _target = target;
    _action = action;
}

- (void)setDatasourceWith:(NSArray *)dataArray
{
    _valueArray = dataArray;
    [_basePicker reloadAllComponents];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _currentValue = [[_valueArray objectAtIndex:row] objectForKey:@"name"];
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _valueArray.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[_valueArray objectAtIndex:row] objectForKey:@"name"];
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
