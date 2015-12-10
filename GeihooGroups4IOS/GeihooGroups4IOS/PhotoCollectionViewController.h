//
//  PhotoCollectionViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/11.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABSWaterFlowLayout.h"
#import "NSDictionary+StringAttributeForKey.h"
#import "Photo.h"
#import "PhotoCollectionViewCell.h"

@interface PhotoCollectionViewController : UICollectionViewController<ABSWaterFlowLayoutDelegate>

@property (nonatomic, assign) NSInteger count;
@property (nonatomic,strong) NSArray  *dataSource;

@end
