//
//  MyListViewController.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "MyListViewController.h"
#import "MyRecommendedListDelegate.h"
#import "MyListDelegate.h"
#import "ListDetailViewController.h"
#import "RecDetailViewController.h"
#import "DataSourceManager.h"
#import "ListModel.h"
#import "RecModel.h"

@interface MyListViewController () <MyListCallBack, MyRecListCallBack, UINavigationControllerDelegate>

@property ListDetailViewController *selectedListController;
@property RecDetailViewController *selectedRecController;


@end

@implementation MyListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        //List Table myListTableView ist im BaseListViewController definiert.
        self.myListTableView.delegate = [MyListDelegate myListInstance];
        self.myListTableView.dataSource = [MyListDelegate myListInstance];
        [MyListDelegate myListInstance].myListViewController = self;
        
        //RecList Table
        self.myRecommendationTableView.delegate = [MyRecommendedListDelegate myRecListInstance];
        self.myRecommendationTableView.dataSource = [MyRecommendedListDelegate myRecListInstance];
        [MyRecommendedListDelegate myRecListInstance].myRecListViewController = self;
        
        //PushViewController
        _selectedListController = [ListDetailViewController new];
        _selectedRecController = [RecDetailViewController new];
        
    }
    return self;
}



#pragma mark - Protokolle implemetieren
- (void)didSelectList:(ListModel *)selectedList
{
    [self callListDetailViewControllerWith:selectedList];
}

- (void)callListDetailViewControllerWith:(ListModel *)selectedList
{
    [_selectedListController setSelectedListWith:selectedList];
    [self.navigationController pushViewController:_selectedListController animated:YES];
}

- (void)didSelectRecommendation:(RecModel *)selectedRecommendation
{
    [self callRecDetailViewControllerWith:selectedRecommendation];
}

- (void)callRecDetailViewControllerWith:(RecModel *)selectedRecommendation
{
    [_selectedRecController setSelectedRecWith:selectedRecommendation];
    [self.navigationController pushViewController:_selectedRecController animated:YES];
}


#warning Hier noch anpassen für die richtigen source Daten!
- (void)viewDidLoad
{
    [super viewDidLoad];
    MyListDelegate *myList = [MyListDelegate myListInstance];
    MyRecommendedListDelegate *myRecList = [MyRecommendedListDelegate myRecListInstance];
    
    NSArray *listItems = [[DataSourceManager useDataMethod] getLists];
    NSArray *recItems = [[DataSourceManager useDataMethod] getRecList];
    [myList fillListWith:listItems];
    [myRecList fillRecListWith:recItems];
   
    
    //[[MyListDelegate sharedInstance] setListArray:[[DataSourceManager sharedInstance] getLists]];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
