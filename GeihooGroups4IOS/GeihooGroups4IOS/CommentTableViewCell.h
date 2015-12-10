//
//  CommentTableViewCell.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/25.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@end
