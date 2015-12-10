//
//  EditCommentTableViewCell.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/28.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleImageView.h"

@interface EditCommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet CircleImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
