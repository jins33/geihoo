//
//  PhotoCollectionViewCell.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/11.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (void)setPhoto:(Photo *)photo {
    _photo = photo;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:_photo.imageUrl]];
}

@end
