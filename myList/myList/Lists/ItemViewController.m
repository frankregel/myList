//
//  ItemViewController.m
//  myList
//
//  Created by Frank on 22.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "ItemViewController.h"
#import "MyItemDelegate.h"
#import "DataSourceManager.h"

@interface ItemViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property ItemModel *selectedItem;
@property UIImagePickerController *imagePickerController;

@end

@implementation ItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self.topTableView removeFromSuperview];
        [self.midTableView removeFromSuperview];
        NSLog(@"%s", __PRETTY_FUNCTION__);
#warning Cam in eigene Klasse umbetten
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

- (void)setSelectedItemWith:(ItemModel *)selectedItem
{
    _selectedItem = selectedItem;
    self.title = [_selectedItem getItemName];
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


#pragma mark - System
- (void)viewDidLoad
{
    [super viewDidLoad];
    MyItemDelegate *myItems = [MyItemDelegate myItemInstance];
    
    NSArray *items = [[DataSourceManager useDataMethod] getLists];
    if (items.count >0)
    {
        NSArray *detail = [items objectAtIndex:0];
        [myItems fillItemListWith:detail];
    }
    
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
