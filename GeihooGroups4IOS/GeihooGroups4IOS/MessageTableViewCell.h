//
//  MessageTableViewCell.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/23.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleImageButton.h"

@interface MessageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet CircleImageButton *userImageBtn;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end
