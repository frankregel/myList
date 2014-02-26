//
//  BaseListViewController.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "BaseListViewController.h"

@interface BaseListViewController ()

@end

@implementation BaseListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        //set Name of the NavBar
        self.navigationItem.title = @"myList";
        //background
        UIImage *baseListBackgroundImage = [UIImage imageNamed:@"altespapier.png"];
        UIImageView *backgroundView = [[UIImageView alloc]initWithImage:baseListBackgroundImage];
        [self.view addSubview:backgroundView];
        //init myListTable
        _myListTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 70, self.view.bounds.size.width -10, 130)];
        
        //Zellen auch auf durchsichtig setzen!
        [_myListTableView setBackgroundView:nil];
        [_myListTableView setBackgroundColor:[UIColor clearColor]];
        
        [self.view addSubview:_myListTableView];
        
        //init myRecTable
        CGFloat yPos = _myListTableView.frame.origin.y + _myListTableView.frame.size.height +10;
        _myRecommendationTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, yPos, self.view.bounds.size.width -10, 130)];
        [_myRecommendationTableView setBackgroundView:nil];
        [_myRecommendationTableView setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:_myRecommendationTableView];
        
        //init MapView
        CGFloat myPos = self.view.bounds.size.height -135;
        _myMapView = [[MKMapView alloc]initWithFrame:CGRectMake(5,myPos, self.view.bounds.size.width -10, 130)];
        _myMapView.showsUserLocation = YES;
        [self.view addSubview:_myMapView];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
