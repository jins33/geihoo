//
//  FriendsMainViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/11.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

#import "SystemPrefixHeader.pch"
#import "GroupsMainCollectionViewCell.h"
#import "GroupsCellHeaderCollectionReusableView.h"
#import "ResultsTableViewController.h"
#import "SocietyBean.h"
#import "GroupsTypeTabViewController.h"
#import "SystemParaManager.h"
#import "CommontEditViewController.h"
#import "SocietyPostBeans.h"
#import "SocietyPostsTableViewCell.h"


@interface FriendsMainViewController : UITableViewController<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *friendCollectionView;
@property (nonatomic, strong) UIViewController *baseController;

@end
