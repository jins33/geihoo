//
//  MyMainPageTableViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/29.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PicTableViewCell.h"
#import "MyMainPageTableViewCell.h"
#import "SystemPrefixHeader.pch"

@interface MyMainPageTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIView *topLineView;
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@property (weak, nonatomic) IBOutlet UIView *horizontalView;
@property UITableView *picTableView;

@end
