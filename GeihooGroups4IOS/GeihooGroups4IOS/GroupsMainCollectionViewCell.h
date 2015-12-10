//
//  GroupsMainCollectionViewCell.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/17.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleImageView.h"

@interface GroupsMainCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet CircleImageView *societyIconImageView;
@property (weak, nonatomic) IBOutlet UITextView *societyNameTextView;

@end
