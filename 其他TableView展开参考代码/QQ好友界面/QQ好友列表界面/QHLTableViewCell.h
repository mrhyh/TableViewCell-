//
//  QHLTableViewCell.h
//  QQ好友列表界面
//
//  Created by Apple on 16/2/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QHLGroup;
@interface QHLTableViewCell : UITableViewCell

@property (nonatomic, strong) QHLGroup *group;
@property (nonatomic, strong) NSIndexPath *indexPath;

+ (instancetype)tableViewCellWithTableView:(UITableView *)tableView;

@end
