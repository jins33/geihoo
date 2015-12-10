//
//  CommontEditViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/23.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocietyBean.h"
#import "EditCommentTableViewCell.h"

@interface CommontEditViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *topTableView;
@property (weak, nonatomic) IBOutlet UITableView *bottomTableView;

@end
