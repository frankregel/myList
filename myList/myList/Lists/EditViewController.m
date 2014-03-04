//
//  EditViewController.m
//  myList
//
//  Created by Frank Regel on 26.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "EditViewController.h"
#import "EditMetaDataView.h"

@interface EditViewController ()


@end

@implementation EditViewController


- (id)initWithTitle:(NSString *)viewName andLeftButtonName:(NSString *)leftButtonName andRightButtonName:(NSString *)rightButtonName
{
    self = [super init];
    if (self)
    {
        [self addTitleLabelWithName:viewName];
        [self addLeftButtonWithName:leftButtonName];
        [self addRightButtonWithName:rightButtonName];
        
        EditMetaDataView *editMetaData = [[EditMetaDataView alloc] initWithFrame:CGRectMake(5, 70, self.view.frame.size.width -10, 260)];
        
        [self.view addSubview:editMetaData];
    }
    return self;
}

#pragma mark - Elemente darstellen


- (void)addLeftButtonWithName:(NSString *)buttonName
{
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 90, 44)];
    [leftButton setTitle:buttonName forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
#warning rausfinden wie man das auf links setzt
    leftButton.titleLabel.textAlignment = NSTextAlignmentLeft;
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
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didTouchLeftButton
{
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
