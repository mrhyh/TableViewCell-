//
//  MJViewController.m
//  03-QQ好友列表
//
//  Created by apple on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJFriendGroup.h"
#import "MJFriend.h"
#import "MJHeaderView.h"
#import "MJFriendCell2TableViewCell.h"

@interface MJViewController () <MJHeaderViewDelegate>
@property (nonatomic, strong) NSArray *groups;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 每一行cell的高度
    self.tableView.rowHeight = 42;
    // 每一组头部控件的高度
    self.tableView.sectionHeaderHeight = 42;
    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, 500);
    //添加footView可以去掉尾部空白的cell
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSArray *)groups
{
    if (_groups == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
        
        NSMutableArray *groupArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            MJFriendGroup *group = [MJFriendGroup groupWithDict:dict];
            [groupArray addObject:group];
        }
        
        _groups = groupArray;
    }
    return _groups;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MJFriendGroup *group = self.groups[section];
    
    return (group.isOpened ? group.friends.count : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    MJFriendCell2TableViewCell *cell = [MJFriendCell2TableViewCell cellWithTableView:tableView];
    cell.indicatorBtn.tag = indexPath.row;
    // 2.设置cell的数据
    MJFriendGroup *group = self.groups[indexPath.section];
    cell.friendData = group.friends[indexPath.row];
    
    return cell;
}

/**
 *  返回每一组需要显示的头部标题(字符出纳)
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 1.创建头部控件
    MJHeaderView *header = [MJHeaderView headerViewWithTableView:tableView identifierWithString:[NSString stringWithFormat:@"identifier%ld",(long)section]];
    header.tag = section;
    header.indicatorBtn.tag = section;
    header.delegate = self;
    
    // 2.给header设置数据(给header传递模型)
    header.group = self.groups[section];
    
    return header;
}

#pragma mark - headerView的代理方法
/**
 *  点击了headerView上面的名字按钮时就会调用
 */
- (void)headerViewDidClickedNameView:(MJHeaderView *)headerView
{
    [self.tableView reloadData];
}
@end
