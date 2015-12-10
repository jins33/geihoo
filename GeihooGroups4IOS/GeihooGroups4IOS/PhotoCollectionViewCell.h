//
//  PhotoCollectionViewCell.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/11.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "Photo.h"

@class Photo;
@interface PhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) Photo  *photo;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end
