//
//  ActivityTableViewCell.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/12.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleImageView.h"

@interface ActivityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet CircleImageView *activityImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *organiserLabel;
@property (weak, nonatomic) IBOutlet UILabel *peopleNumLabel;

@end
