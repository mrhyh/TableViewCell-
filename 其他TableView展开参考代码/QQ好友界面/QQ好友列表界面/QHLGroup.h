//
//  QHLGroup.h
//  QQ好友列表界面
//
//  Created by Apple on 16/1/31.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QHLGroup : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int online;
@property (nonatomic, strong) NSArray *friends;

@property (nonatomic, assign, getter=isEmpty) BOOL empty;

//设置组是否可见的属性
@property (nonatomic, assign, getter=isVisible) BOOL visible;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;

@end
