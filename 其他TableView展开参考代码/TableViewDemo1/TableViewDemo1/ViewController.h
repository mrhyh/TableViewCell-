//
//  ViewController.h
//  TableViewDemo1
//
//  Created by 俞亿 on 12-4-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView *DataTable;
    NSMutableArray *groupArray;
}
@end
