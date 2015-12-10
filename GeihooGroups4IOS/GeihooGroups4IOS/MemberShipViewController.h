//
//  MemberShipViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/29.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoleTableViewCell.h"

@interface MemberShipViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *topTableView;
@property (weak, nonatomic) IBOutlet UITableView *bottomTableView;

@end
