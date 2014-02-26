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
@property (nonatomic) NSArray *recArray;

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

- (void)fillRecListWith:(NSArray *)recArray
{
    _recArray = recArray;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_myRecListViewController)
    {
        RecModel *selectedRec = [_recArray objectAtIndex:indexPath.row];
        [_myRecListViewController didSelectRecommendation:selectedRec];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = _recArray.count;
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.backgroundColor = [UIColor clearColor];
    RecModel *selectedRec = [_recArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [selectedRec getRecName];
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
    [headerView setHeaderStyleWithBorderWidth:2 andBorderColor:[UIColor blackColor] andCornerRadius:5];
    
    
    return headerView;
    
}
@end
