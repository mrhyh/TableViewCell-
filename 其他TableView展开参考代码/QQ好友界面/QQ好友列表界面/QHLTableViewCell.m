//
//  QHLTableViewCell.m
//  QQ好友列表界面
//
//  Created by Apple on 16/2/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "QHLTableViewCell.h"
#import "QHLGroup.h"
#import "QHLFriend.h"


@interface QHLTableViewCell ()
@property (nonatomic, weak) UIView *coverView;
@property (nonatomic, weak) UILabel *titleLabel;

@end
@implementation QHLTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

+ (instancetype)tableViewCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"cell";
    QHLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[QHLTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 44)];
        
        [self.contentView addSubview:coverView];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(55, 44, 320, 0.5)];
        lineView.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1.0];
        [coverView addSubview:lineView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor blackColor];
        self.titleLabel = titleLabel;
        
        [coverView addSubview:titleLabel];
    }
    return self;
}


- (void)setGroup:(QHLGroup *)group {
    _group = group;
    
    QHLFriend *friend;
    
    if ((group.empty && group.visible && self.indexPath.row == group.friends.count) || (group.empty && !group.visible)) {
        
        self.userInteractionEnabled = NO;
        
        self.contentView.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1.0];
        
        friend = nil;
    } else {
        self.userInteractionEnabled = YES;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        friend = group.friends[self.indexPath.row];
    }
    
    self.titleLabel.text = friend.name;
}
@end
