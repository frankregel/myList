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
#import "EditViewController.h"
#import "DataSourceManager.h"
#import "ListModel.h"
#import "RecModel.h"

@interface MyListViewController () <MyListCallBack, MyRecListCallBack>

@property ListDetailViewController *selectedListController;
@property RecDetailViewController *selectedRecController;
@property EditViewController *editViewController;


@end

@implementation MyListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        //BarButtonItems
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didCallNewList)];
        self.navigationItem.rightBarButtonItem = addButton;
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
        
        //Modale Controller
        _editViewController = [[EditViewController alloc] initWithTitle:@"Neue Liste" andLeftButtonName:@"Fertig" andRightButtonName:@"Abbrechen"];
        
    }
    return self;
}

#pragma mark - Neue Liste anlegen
- (void)didCallNewList
{
    _editViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    _editViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:_editViewController animated:YES completion:nil];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
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
