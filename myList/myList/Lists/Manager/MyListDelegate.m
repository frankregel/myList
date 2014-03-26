//
//  MyListDelegate.m
//  myList
//
//  Created by Frank Regel on 14.02.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "MyListDelegate.h"
#import "Lists.h"

@interface MyListDelegate ()
@property (nonatomic)  NSArray *listArray;
@property (strong) CallbackHandler handler;
@end

@implementation MyListDelegate

+ (MyListDelegate *)myListInstance
{
    //define, that sharedInstance exist exact 1 time
    static MyListDelegate *_myListInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _myListInstance = [self new];
    });
    return _myListInstance;
}

- (void)fillListWith:(NSArray *)listArray
{
    _listArray = listArray;
}

- (void)fillListWith:(NSArray *)listArray andCallbackHandler:(CallbackHandler)handler
{
    _listArray = listArray;
    _handler = handler;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (_myListViewController)
//    {
//        ListModel *selectedList = [_listArray objectAtIndex:indexPath.row];
//        [_myListViewController didSelectList:selectedList];
//    }
    
    if (_handler)
    {
        Lists *selectedList = [_listArray objectAtIndex:indexPath.row];
        _handler(selectedList);
    }
    
}
//Tabelle befüllen
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [UITableViewCell new];
    //wenn die Zelle nicht durchsichtig ist, kann man den Hintergrunf nicht sehen!
    cell.backgroundColor = [UIColor clearColor];
    Lists *selectedList = [_listArray objectAtIndex:indexPath.row];
    cell.textLabel.text = selectedList.listname;
    return cell;
}

#pragma mark - table Standard Setting
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = _listArray.count;
    return rows;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}
@end
