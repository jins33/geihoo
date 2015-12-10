//
//  PostDetailTableViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/25.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentTableViewCell.h"

@interface PostDetailTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIView *headerView;
- (IBAction)showPop:(id)sender;

@end
