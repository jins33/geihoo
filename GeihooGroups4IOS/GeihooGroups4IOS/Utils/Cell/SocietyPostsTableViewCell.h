//
//  SocietyPostsTableViewCell.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/9.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleImageButton.h"

@interface SocietyPostsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet CircleImageButton *userImageBtn;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postProLabel;
@property (weak, nonatomic) IBOutlet UITextView *postDescriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
- (IBAction)showPop:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;

@end
