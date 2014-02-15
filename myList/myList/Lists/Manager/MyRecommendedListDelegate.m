//
//  MyRecommendedListDelegate.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "MyRecommendedListDelegate.h"
#import "TableHeaderView.h"

@implementation MyRecommendedListDelegate

+ (MyRecommendedListDelegate *)sharedInstance
{
    //define, that sharedInstance exist exact 1 time
    static MyRecommendedListDelegate *_sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [self new];
    });
    return _sharedInstance;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = @"RecView";
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
