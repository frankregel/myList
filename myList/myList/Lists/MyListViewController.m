//
//  MyListViewController.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "MyListViewController.h"
#import "MyRecommendedListDelegate.h"
#import "ListDetailViewController.h"
#import "DataSourceManager.h"
#import "MyListDelegate.h"
#import "ListModel.h"

@interface MyListViewController () <MyListCallBack>

@property ListDetailViewController *selectedListController;

@end

@implementation MyListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.view.backgroundColor = [UIColor blueColor];
        self.myListTableView.delegate = [MyListDelegate sharedInstance];
        self.myListTableView.dataSource = [MyListDelegate sharedInstance];
        self.myRecommendationTableView.delegate = [MyRecommendedListDelegate sharedInstance];
        self.myRecommendationTableView.dataSource = [MyRecommendedListDelegate sharedInstance];
        [MyListDelegate sharedInstance].callBackDelegate = self;
        _selectedListController = [ListDetailViewController new];
    }
    return self;
}

- (void)didSelectList:(ListModel *)selectedList
{
    [self callListDetailViewControllerWith:selectedList];
}

- (void)callListDetailViewControllerWith:(ListModel *)selectedList
{
    [_selectedListController setSelectedListWith:selectedList];
    [self.navigationController pushViewController:_selectedListController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    MyListDelegate *singleTonListDelegate = [MyListDelegate sharedInstance];
    DataSourceManager *singletonDataSource = [DataSourceManager sharedInstance];
    NSArray *listItems = [singletonDataSource getLists];
    [singleTonListDelegate setListArray:listItems];
    
    //[[MyListDelegate sharedInstance] setListArray:[[DataSourceManager sharedInstance] getLists]];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
