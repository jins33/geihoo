//
//  ContactListTableViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/23.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactListTableViewCell.h"

@interface ContactListTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *contactsTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
