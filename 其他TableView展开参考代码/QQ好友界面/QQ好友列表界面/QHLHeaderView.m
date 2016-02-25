
//
//  QHLHeaderView.m
//  QQ好友列表界面
//
//  Created by Apple on 16/1/31.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "QHLHeaderView.h"
#import "QHLGroup.h"

@interface QHLHeaderView ()

@property (nonatomic, weak) UIButton *coverButton;
@property (nonatomic, weak) UILabel *countLabel;

@end

@implementation QHLHeaderView

- (void)setUpCoverButton {
    UIButton *coverButton = [[UIButton alloc] init];
    
    self.coverButton = coverButton;
    [self.contentView addSubview:coverButton];
    
    [coverButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
    
    [coverButton addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [coverButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    coverButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    coverButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    coverButton.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    
    coverButton.imageView.contentMode = UIViewContentModeCenter;
    coverButton.imageView.clipsToBounds = NO;
}

- (void)setUpCountLabel {
    UILabel *countLabel = [[UILabel alloc] init];
    
    self.countLabel = countLabel;
    [self.contentView addSubview:countLabel];
    
    countLabel.textColor = [UIColor blackColor];
    countLabel.textAlignment = NSTextAlignmentRight;
}

+ (instancetype)headerViewWithTableView:(UITableView *)tableView {
    static NSString *ID = @"headerView";
    QHLHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (!headerView) {
        headerView = [[QHLHeaderView alloc] initWithReuseIdentifier:ID];
        
        
    }
    return headerView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self setUpCoverButton];
        [self setUpCountLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.coverButton.frame = self.bounds;
    self.countLabel.frame = CGRectMake(200, 0, 150, 44);
}



- (void)didClickButton:(UIButton *)button {
    if ([self.headerViewDelegate respondsToSelector:@selector(headerViewDidClickButton:)]) {
        [self.headerViewDelegate headerViewDidClickButton:self];
    }
}

- (void)setGroup:(QHLGroup *)group {
    _group = group;
    
    [self.coverButton setTitle:group.name forState:UIControlStateNormal];
    self.countLabel.text = [NSString stringWithFormat:@"%d/%ld", group.online, group.friends.count];
}

- (void)setRotate:(BOOL)rotate {
    _rotate = rotate;
    
    if (rotate) {
        self.coverButton.imageView.transform = CGAffineTransformRotate(self.coverButton.transform, M_PI_2);
    } else {
        self.coverButton.imageView.transform = CGAffineTransformRotate(self.coverButton.transform, 0);
    }
}
@end
