//
//  GroupsCollectionViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/26.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SystemPrefixHeader.pch"
#import "GroupsMainCollectionViewCell.h"
#import "GroupsCellFooterCollectionReusableView.h"
#import "GroupsCellHeaderCollectionReusableView.h"
#import "SocietyBean.h"
#import "SystemParaManager.h"

@interface GroupsCollectionViewController : UICollectionViewController

@property (nonatomic, strong) id baseController;

@end