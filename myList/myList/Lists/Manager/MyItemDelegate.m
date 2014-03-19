//
//  MyItemDelegate.m
//  myList
//
//  Created by Frank on 22.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "MyItemDelegate.h"

@interface MyItemDelegate ()
@property (nonatomic) NSArray *itemArray;
@property (nonatomic) NSArray *listArray;
@property (strong) CompletionTest compTest;


@end

@implementation MyItemDelegate

+ (MyItemDelegate *)myItemInstance
{
    static MyItemDelegate *_myItemInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^
              {_myItemInstance = [self new];
              });
    return _myItemInstance;
}

- (void)fillItemListWith:(NSArray *)itemArray
{
    _itemArray = itemArray;
}

- (void)fillItemListWith:(NSArray *)itemArray andHandler:(CompletionTest)CompTest
{
    _itemArray = itemArray;
    _compTest = CompTest;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (_myItemViewController)
//    {
//        ItemModel *selectedItem = [_itemArray objectAtIndex:indexPath.row];
//        [_myItemViewController didSelectItem:selectedItem];
//    }
    
    if (_compTest)
    {
        ItemModel *selectedItem = [_itemArray objectAtIndex:indexPath.row];
        _compTest(selectedItem);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = _itemArray.count;
    return rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.backgroundColor = [UIColor clearColor];
    ItemModel *selectedItem = [_itemArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [selectedItem getItemName];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}

@end
