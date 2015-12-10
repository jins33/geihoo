//
//  SocietyPostsTableViewCell.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/9.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import "SocietyPostsTableViewCell.h"

@implementation SocietyPostsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)showPop:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"操作"message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"收藏", @"编辑帖子", @"置顶", @"删除", @"举报", nil];
    [alertView show];
}
@end
