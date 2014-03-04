//
//  ListDetailViewController.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "ListDetailViewController.h"
#import "ItemViewController.h"
#import "MyItemDelegate.h"


@interface ListDetailViewController () <MyItemCallBack>
@property ItemModel *selectedItem;
@property ListModel *selectedList;
@property ItemViewController *selectedItemController;


@end

@implementation ListDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        
        //Tabelle 1 füllen
        self.topTableView.delegate = [MyItemDelegate myItemInstance];
        self.topTableView.dataSource = [MyItemDelegate myItemInstance];
        //Tabelle 2 befüllen
        [self.midTableView removeFromSuperview];
        
        [MyItemDelegate myItemInstance].myItemViewController = self;
        
        //pushViewController
        //_selectedItemController = [ItemViewController new];
        
        
    }
    return self;
}

- (void)didSelectItem:(ItemModel *)selectedItem
{
    _selectedItem = selectedItem;
}



- (void)setSelectedListWith:(ListModel *)selectedList
{
    _selectedList = selectedList;
    self.title = [_selectedList getListName];
    NSArray *tmpArray = [_selectedList getListItems];
    //Daten übertragen
    [[MyItemDelegate myItemInstance] fillItemListWith:tmpArray];
    [self.topTableView reloadData];
    NSLog(@"%lu", (unsigned long)[tmpArray count]);
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
