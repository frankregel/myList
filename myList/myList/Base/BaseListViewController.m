//
//  BaseListViewController.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "BaseListViewController.h"
#import <QuartzCore/QuartzCore.h>

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
        _topTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 70, self.view.bounds.size.width -10, 130)];
        
        //Zellen auch auf durchsichtig setzen!
        [_topTableView setBackgroundView:nil];
        [_topTableView setBackgroundColor:[UIColor clearColor]];
        _topTableView.layer.borderWidth = 1;
        _topTableView.layer.borderColor = [[UIColor blackColor] CGColor];
        _topTableView.layer.cornerRadius = 5;
        
        
        [self.view addSubview:_topTableView];
        
        //init myRecTable
        CGFloat yPos = _topTableView.frame.origin.y + _topTableView.frame.size.height +10;
        _midTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, yPos, self.view.bounds.size.width -10, 130)];
        [_midTableView setBackgroundView:nil];
        [_midTableView setBackgroundColor:[UIColor clearColor]];
        _midTableView.layer.borderWidth = 1;
        _midTableView.layer.borderColor = [[UIColor blackColor] CGColor];
        _midTableView.layer.cornerRadius = 5;
        [self.view addSubview:_midTableView];
        
        //init MapView
        CGFloat myPos = self.view.bounds.size.height -135;
        _myMapView = [[MKMapView alloc]initWithFrame:CGRectMake(5,myPos, self.view.bounds.size.width -10, 130)];
        _myMapView.showsUserLocation = YES;
        _myMapView.layer.borderWidth = 1;
        _myMapView.layer.borderColor = [[UIColor blackColor] CGColor];
        _myMapView.layer.cornerRadius = 5;
        //_myMapView.region = MKCoordinateRegionMakeWithDistance(_myMapView.userLocation.coordinate, 400, 400);
        [self.view addSubview:_myMapView];
        
        
    }
    return self;
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    //Region 800 * 800 Meter um die Location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 400, 400);
    
    //Annotation adden (Marke setzen)
    MKPointAnnotation *marke = [MKPointAnnotation new];
    marke.coordinate = userLocation.coordinate;
    marke.title = @"Wo bin ich?";
    marke.subtitle = @"genau hier!";
    [_myMapView addAnnotation:marke];
    
    
    [_myMapView setRegion:[_myMapView regionThatFits:region]animated:YES];
    
}

#warning irgendwie geht das mit der map nicht richtig
- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.myMapView.delegate = self.myMapView;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
