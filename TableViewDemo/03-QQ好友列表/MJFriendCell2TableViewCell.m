//
//  MJFriendCell2TableViewCell.m
//  03-QQ好友列表
//
//  Created by ylgwhyh on 16/2/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MJFriendCell2TableViewCell.h"

@implementation MJFriendCell2TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"friend";
    MJFriendCell2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MJFriendCell2TableViewCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)setFriendData:(MJFriend *)friendData
{
    _friendData = friendData;
    [_indicatorBtn.imageView setImage:[UIImage imageNamed:friendData.icon]];
    _nameLabel.text = friendData.name;
    _nameLabel.textColor = friendData.isVip ? [UIColor redColor] : [UIColor blackColor];
    //self.detailTextLabel.text = friendData.intro;
}

- (void)setNameLabel:(UILabel *)nameLabel{
    _nameLabel = nameLabel;
}

- (IBAction)indicatorBtn:(id)sender {
}
@end
