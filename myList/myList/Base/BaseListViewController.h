//
//  BaseListViewController.h
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface BaseListViewController : UIViewController

@property UITableView *myListTableView;
@property UITableView *myRecommendationTableView;
@property MKMapView *myMapView;

@end
