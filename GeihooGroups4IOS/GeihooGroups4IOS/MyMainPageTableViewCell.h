//
//  MyMainPageTableViewCell.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/31.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumCollectionViewCell.h"
#import "SystemPrefixHeader.pch"

@interface MyMainPageTableViewCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, weak) NSArray *imageNames;
@property (weak, nonatomic) IBOutlet UICollectionView *photoCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *photoHeightCons;

- (void)initData;
- (void)initView;

@end
