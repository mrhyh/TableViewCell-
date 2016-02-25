//
//  ViewController.m
//  QQ好友列表界面
//
//  Created by Apple on 16/1/31.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "QHLFriend.h"
#import "QHLGroup.h"
#import "QHLHeaderView.h"
#import "QHLTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, QHLHeaderViewDelegate>

@property (nonatomic, strong) NSMutableArray *groups;
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation ViewController

- (NSMutableArray *)groups {
    if (!_groups) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *model = [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            QHLGroup *group = [QHLGroup groupWithDict:dict];
            [model addObject:group];
        }
        _groups = model;
    }
    return _groups;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor redColor];
    
    self.title = @"QQ好友列表";
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    
    self.tableView = tableView;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    headView.backgroundColor = [UIColor orangeColor];
    self.tableView.tableHeaderView = headView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    QHLGroup *group = self.groups[section];
    
    if (group.visible) { //组cell显示
        if (group.empty) {
            return group.friends.count + 1;
        } else {
            return group.friends.count;
        }
    } else { //组cell隐藏
        if (group.empty) {
            return 1;
        } else {
            return 0;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QHLGroup *group = self.groups[indexPath.section];
    
    QHLTableViewCell *cell = [QHLTableViewCell tableViewCellWithTableView:tableView];
    
    cell.indexPath = indexPath;
    cell.group = group;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    QHLGroup *group = self.groups[indexPath.section];
    
    if (group.empty) { //有空cell
        if (group.visible) { //组cell显示
            if (indexPath.row == group.friends.count) { //最后一个cell
                return 22;
            } else { //最后一个之前的cell
                return 44;
            }
        } else { //组cell隐藏
            return 22;
        }
    } else {//无空cell
        return 44;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    QHLGroup *group = self.groups[section];
    
    QHLHeaderView *headerView = [QHLHeaderView headerViewWithTableView:tableView];
    
    headerView.headerViewDelegate = self;
    headerView.group = group;
    headerView.tag = section;
    
    //设置是否旋转
    headerView.rotate = group.visible;
    
    return headerView;
}

- (void)headerViewDidClickButton:(QHLHeaderView *)headerView {
    
    QHLGroup *group = headerView.group;
    
    group.visible = !group.visible;
    [self.tableView reloadData];
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s----%ld",__func__,indexPath.row);
}
@end
