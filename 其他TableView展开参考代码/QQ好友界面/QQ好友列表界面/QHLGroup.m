//
//  QHLGroup.m
//  QQ好友列表界面
//
//  Created by Apple on 16/1/31.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "QHLGroup.h"
#import "QHLFriend.h"

@implementation QHLGroup
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        //把self.friend字典转换成模型
        NSMutableArray *arrayModel = [NSMutableArray array];
        
        for (NSDictionary *dict_fri in self.friends) {
            QHLFriend *model = [QHLFriend friendWithDict:dict_fri];
            [arrayModel addObject:model];
        }
        self.friends = arrayModel;
    }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
