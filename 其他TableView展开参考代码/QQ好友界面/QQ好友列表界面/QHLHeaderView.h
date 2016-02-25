//
//  QHLHeaderView.h
//  QQ好友列表界面
//
//  Created by Apple on 16/1/31.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QHLGroup, QHLHeaderView;

@protocol QHLHeaderViewDelegate <NSObject>

- (void)headerViewDidClickButton:(QHLHeaderView *)headerView;

@end

@interface QHLHeaderView : UITableViewHeaderFooterView
+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) QHLGroup *group;
@property (nonatomic, assign, getter=isRotate) BOOL rotate;
@property (nonatomic, weak) id<QHLHeaderViewDelegate> headerViewDelegate;
@end
