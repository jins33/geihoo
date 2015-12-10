//
//  GroupSetingViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/23.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupSetingViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *typeTableView;

@end
