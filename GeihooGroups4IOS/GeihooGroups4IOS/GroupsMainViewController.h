//
//  GroupsMainViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/11.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemPrefixHeader.pch"
#import "GroupsMainCollectionViewCell.h"
#import "GroupsCellFooterCollectionReusableView.h"
#import "GroupsCellHeaderCollectionReusableView.h"
#import "ResultsTableViewController.h"
#import "SocietyBean.h"
#import "GroupsTypeTabViewController.h"
#import "SystemParaManager.h"
#import "CommontEditViewController.h"

@interface GroupsMainViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *friendCollectionView;
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) UISearchController *searchController;

@end
