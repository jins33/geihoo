//
//  MeViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/28.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyInfoTableViewController.h"
#import "BasicTableViewCell.h"
#import "CircleImageView.h"
#import "UIImage+ImageAddition.h"
#import "JCAlertView.h"
#import "SystemPrefixHeader.pch"

@interface MeViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *meTableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
- (IBAction)showBarcode:(id)sender;

@end