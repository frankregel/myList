//
//  MyRecommendedListDelegate.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "MyRecommendedListDelegate.h"
#import "TableHeaderView.h"

@interface MyRecommendedListDelegate ()
@property (nonatomic) NSArray *listArray;

@end

@implementation MyRecommendedListDelegate

+ (MyRecommendedListDelegate *)myRecListInstance
{
    //define, that sharedInstance exist exact 1 time
    static MyRecommendedListDelegate *_myRecListInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _myRecListInstance = [self new];
    });
    return _myRecListInstance;
}

- (void)fillListWith:(NSArray *)listArray
{
    _listArray = listArray;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_callBackDelegate)
    {
        ListModel *selectedList = [_listArray objectAtIndex:indexPath.row];
        [_callBackDelegate didSelectList:selectedList];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = _listArray.count;
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    ListModel *selectedList = [_listArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [selectedList getListName];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 43.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Empfehlung";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TableHeaderView *headerView = [TableHeaderView new];
    [headerView setImageWith:@"headerPic.png" andName:@"Empfehlung"];
    
    return headerView;
    
}
@end
