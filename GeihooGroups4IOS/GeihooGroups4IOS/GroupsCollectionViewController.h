//
//  GroupsCollectionViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/26.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

#import "SystemPrefixHeader.pch"
#import "GroupsMainCollectionViewCell.h"
#import "GroupsCellFooterCollectionReusableView.h"
#import "GroupsCellHeaderCollectionReusableView.h"
#import "SocietyBean.h"
#import "SystemParaManager.h"
#import "ResultsTableViewController.h"
#import "GroupsTypeTabViewController.h"

@interface GroupsCollectionViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate>

@property (nonatomic, strong) UIViewController *baseController;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (strong, nonatomic) UISearchController *searchController;


@end