//
//  MyListDelegate.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "MyListDelegate.h"

@interface MyListDelegate ()
@property (nonatomic)  NSArray *listArray;

@end

@implementation MyListDelegate

+ (MyListDelegate *)sharedInstance
{
    //define, that sharedInstance exist exact 1 time
    static MyListDelegate *_sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [self new];
    });
    return _sharedInstance;
}

- (void)setListArray:(NSArray *)listArray
{
    _listArray = listArray;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_callBackDelegate)
    {
        ListModel *selectedList = [_listArray objectAtIndex:indexPath.row];
        [_callBackDelegate didSelectList:selectedList];
    }
}

#pragma mark - table Standard Setting
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = _listArray.count;
    return rows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    ListModel *selectedList = [_listArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [selectedList getListName];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}
@end
