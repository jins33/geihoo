//
//  RoleTableViewCell.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/29.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleImageView.h"

@interface RoleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet CircleImageView *userImg;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *roleLabel;

@end
