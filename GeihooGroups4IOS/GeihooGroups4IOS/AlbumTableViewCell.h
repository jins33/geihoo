//
//  AlbumTableViewCell.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/14.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumTableViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *albumPhotoImageView;
@property (weak, nonatomic) IBOutlet UILabel *albumNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoNumLabel;

@end
