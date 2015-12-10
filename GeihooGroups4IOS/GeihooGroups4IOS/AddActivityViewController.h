//
//  AddActivityViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/1.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDatePickerView.h"
#import "PlaceholderTextView.h"

@interface AddActivityViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet PlaceholderTextView *activityInfo;
@property (weak, nonatomic) IBOutlet UITableView *activityTableView;

@end
