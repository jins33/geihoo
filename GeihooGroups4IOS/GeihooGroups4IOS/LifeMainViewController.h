//
//  LifeMainViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/28.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemPrefixHeader.pch"
#import "GroupsMainCollectionViewCell.h"
#import "CircleImageView.h"

@interface LifeMainViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
