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

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //init myListTable
    _myListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200) style:UITableViewStylePlain];
    
    [self.view addSubview:_myListTableView];
    
    //init myRecTable
    CGFloat yPos = _myListTableView.frame.origin.y + _myListTableView.frame.size.height +10;
    _myRecommendationTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, yPos, self.view.bounds.size.width, 130)];
    [self.view addSubview:_myRecommendationTableView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
