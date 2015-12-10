//
//  PicCollectionViewCell.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/25.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceholderTextView.h"

@interface PicCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *picBtn;
@property (weak, nonatomic) IBOutlet UIButton *xBtn;
@property (weak, nonatomic) IBOutlet PlaceholderTextView *picInfo;

@end
