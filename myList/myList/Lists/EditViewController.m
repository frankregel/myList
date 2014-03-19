//
//  EditViewController.m
//  myList
//
//  Created by Frank Regel on 26.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "EditViewController.h"
#import "EditMetaDataView.h"
#import "EditSettingsView.h"
#import "ListModel.h"
#import "DataSourceManager.h"

@interface EditViewController ()
@property ListModel *editList;
@property EditMetaDataView *metaDataView;
@property EditSettingsView *settingsDataView;

@end

@implementation EditViewController


- (id)initWithTitle:(NSString *)viewName andLeftButtonName:(NSString *)leftButtonName andRightButtonName:(NSString *)rightButtonName
{
    self = [super init];
    if (self)
    {
        
        _editList = [ListModel new];
        
        [self addTitleLabelWithName:viewName];
        [self addLeftButtonWithName:leftButtonName];
        [self addRightButtonWithName:rightButtonName];
        
        _metaDataView = [[EditMetaDataView alloc] initWithFrame:CGRectMake(5, 70, self.view.frame.size.width -10, 260)];
        
        [self.view addSubview:_metaDataView];
    }
    return self;
}

#pragma mark - Elemente darstellen


- (void)addLeftButtonWithName:(NSString *)buttonName
{
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 90, 44)];
    [leftButton setTitle:buttonName forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
    [leftButton addTarget:self action:@selector(didTouchLeftButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
}

- (void)addRightButtonWithName:(NSString *)buttonName
{
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width -95, 20, 90, 44)];
    [rightButton setTitle:buttonName forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(didTouchRightButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightButton];
}



- (void)addTitleLabelWithName:(NSString *)titleName
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = titleName;
    [self.view addSubview:titleLabel];
}

#warning Fertig noch implementieren / speichern
#pragma mark - actions
- (void)didTouchRightButton
{
    [self dismissViewControllerAnimated:YES completion:^(void){
        NSLog(@"Handler");
    }];
}

- (void)didTouchLeftButton
{
    ListModel *transferModel = [ListModel new];
    [transferModel setListName:_metaDataView.title.text];
    [transferModel setCountry:_metaDataView.countryString];
    [transferModel setRegionName:_metaDataView.region.text];
    [transferModel setCityName:_metaDataView.city.text];
#warning dummies, weil noch nicht implementiert!
    [transferModel setButtonColor:@"clearColor"];
    [transferModel setBackGroundImageString:@""];
    
    //[[DataSourceManager useDataMethod]addList:transferModel];
    
    [self dismissViewControllerAnimated:YES completion:^(void){
        [[DataSourceManager useDataMethod]addList:transferModel];
    }];
    
    
    NSLog(@"Noch nicht implementiert!");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
