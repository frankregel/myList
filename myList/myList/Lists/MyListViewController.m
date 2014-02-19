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
#import "RecDetailViewController.h"
#import "DataSourceManager.h"
#import "MyListDelegate.h"
#import "ListModel.h"
#import "RecModel.h"

@interface MyListViewController () <MyListCallBack, MyRecListCallBack, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property ListDetailViewController *selectedListController;
@property RecDetailViewController *selectedRecController;
@property UIImagePickerController *imagePickerController;

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
        [MyListDelegate myListInstance].myListViewController = self;
        
        //RecList Table
        self.myRecommendationTableView.delegate = [MyRecommendedListDelegate myRecListInstance];
        self.myRecommendationTableView.dataSource = [MyRecommendedListDelegate myRecListInstance];
        [MyRecommendedListDelegate myRecListInstance].myRecListViewController = self;
        
        //PushViewController
        _selectedListController = [ListDetailViewController new];
        _selectedRecController = [RecDetailViewController new];
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            _imagePickerController = [UIImagePickerController new];
            _imagePickerController.delegate = self;
            _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self addPhotoButtonItem];
        }
        
    }
    return self;
}

#pragma mark - Kamera konfigurieren
- (void)addPhotoButtonItem
{
    self.navigationItem.title = @"Foto aufnehmen";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(didCallCam)];
}

- (void)didCallCam
{
    [self.view addSubview:_imagePickerController.view];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [_imagePickerController.view removeFromSuperview];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [_imagePickerController.view removeFromSuperview];
    
    UIImage *infoImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImageWriteToSavedPhotosAlbum(infoImage, nil, nil, nil);
//    UIImageView *backView = [[UIImageView alloc]initWithImage:infoImage];
//    [self.view addSubview:backView];
    
    NSLog(@"%@", info);
    
    
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
