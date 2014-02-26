//
//  RecDetailViewController.m
//  myList
//
//  Created by Frank Regel on 19.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "RecDetailViewController.h"

@interface RecDetailViewController ()

@property RecModel *selectedRec;

@end

@implementation RecDetailViewController

#warning REC Delegate etc implementieren
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
       //self.myListTableView.delegate =
        // Custom initialization
    }
    return self;
}

- (void)setSelectedRecWith:(RecModel *)selectedRec
{
    _selectedRec = selectedRec;
    self.title = [_selectedRec getRecName];
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
