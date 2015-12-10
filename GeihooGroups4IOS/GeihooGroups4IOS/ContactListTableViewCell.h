//
//  ContactListTableViewCell.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/23.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleImageButton.h"

@interface ContactListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet CircleImageButton *userImageBtn;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end
