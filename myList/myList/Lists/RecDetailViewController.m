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

@end

@implementation RecDetailViewController

#warning REC Delegate etc implementieren
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        self.topTableView.delegate = [MyItemDelegate myItemInstance];
        self.topTableView.dataSource = [MyItemDelegate myItemInstance];
        [self.midTableView removeFromSuperview];
        [MyItemDelegate myItemInstance].myItemViewController = self;
    }
    return self;
}

- (void)didSelectItem:(ItemModel *)selectedItem
{
    _selectedItem = selectedItem;
}

- (void)setSelectedRecWith:(RecModel *)selectedRec
{
    _selectedRec = selectedRec;
    self.title = [_selectedRec getRecName];
    NSArray *tmpArray = [_selectedRec getRecItems];
    //Daten übertragen
    [[MyItemDelegate myItemInstance] fillItemListWith:tmpArray];
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
