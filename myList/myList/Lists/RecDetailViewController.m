//
//  RecDetailViewController.m
//  myList
//
//  Created by Frank Regel on 19.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "RecDetailViewController.h"
#import "ItemViewController.h"
#import "MyItemDelegate.h"


@interface RecDetailViewController () <MyItemCallBack>

@property ItemModel *selectedItem;
@property RecModel *selectedRec;
@property ItemViewController *selectedItemController;
@property MyItemDelegate *recDelegate;

@end

@implementation RecDetailViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        _recDelegate = [MyItemDelegate new];
        self.topTableView.delegate = _recDelegate;
        self.topTableView.dataSource = _recDelegate;
        [self.midTableView removeFromSuperview];
        _recDelegate.myItemViewController = self;
        //Instanzieren des SelctedItem
        _selectedItemController = [ItemViewController new];
    }
    return self;
}

- (void)didSelectItem:(ItemModel *)selectedItem
{
    [_selectedItemController setSelectedItemWith:selectedItem];
    [self.navigationController pushViewController:_selectedItemController animated:YES];
}

- (void)setSelectedRecWith:(RecModel *)selectedRec
{
    _selectedRec = selectedRec;
    self.title = [_selectedRec getRecName];
    NSArray *tmpArray = [_selectedRec getRecItems];
    //Daten übertragen
    [_recDelegate fillItemListWith:tmpArray];
    [self.topTableView reloadData];
    
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
