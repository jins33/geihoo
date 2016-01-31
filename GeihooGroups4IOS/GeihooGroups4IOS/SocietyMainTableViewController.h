//
//  SocietyMainTableViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/8/31.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <MJRefresh.h>
#import "SystemPrefixHeader.pch"
#import "SocietyPostsTableViewCell.h"
#import "SocietyPostBeans.h"
#import "SystemParaManager.h"

@interface SocietyMainTableViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *postInfoArray;
    NSArray *userNameArray;
    NSArray *postDescriptionArray;
}
@property (weak, nonatomic) IBOutlet UITableView *postTableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *topMessView;
@property (weak, nonatomic) IBOutlet UIView *memberView;

@end
