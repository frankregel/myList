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
        //nur zum Test
        self.view.backgroundColor = [UIColor blueColor];
        //List Table myListTableView ist im BaseListViewController definiert.
        self.myListTableView.delegate = [MyListDelegate myListInstance];
        self.myListTableView.dataSource = [MyListDelegate myListInstance];
        [MyListDelegate myListInstance].callBackDelegate = self;
        
        //RecList Table
        self.myRecommendationTableView.delegate = [MyRecommendedListDelegate myRecListInstance];
        self.myRecommendationTableView.dataSource = [MyRecommendedListDelegate myRecListInstance];
        [MyRecommendedListDelegate myRecListInstance].callBackDelegate = self;
        
        //PushViewController
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

#warning Hier noch anpassen für die richtigen source Daten!
- (void)viewDidLoad
{
    [super viewDidLoad];
    MyListDelegate *myList = [MyListDelegate myListInstance];
    MyRecommendedListDelegate *myRecList = [MyRecommendedListDelegate myRecListInstance];
    
    NSArray *listItems = [[DataSourceManager useDataMethod] getLists];
    [myList fillListWith:listItems];
    [myRecList fillListWith:listItems];
   
    
    //[[MyListDelegate sharedInstance] setListArray:[[DataSourceManager sharedInstance] getLists]];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
