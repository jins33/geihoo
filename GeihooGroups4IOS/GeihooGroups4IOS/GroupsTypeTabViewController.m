//
//  GroupsTypeTabViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/26.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "GroupsTypeTabViewController.h"

@interface GroupsTypeTabViewController ()

@end

@implementation GroupsTypeTabViewController

- (void)loadView{
    [super loadView];
    
    [self setTitleFont:[UIFont systemFontOfSize:13]];
    
    GroupsCollectionViewController *groupsMain = [self.storyboard instantiateViewControllerWithIdentifier:@"groupsMain"];
    [groupsMain setTitle:@"族族"];
    [groupsMain setBaseController:self];
    
    FriendsMainViewController *friendsMain = [self.storyboard instantiateViewControllerWithIdentifier:@"friendsMain"];
    [friendsMain setTitle:@"朋友圈"];
    [friendsMain setBaseController:self];
    
    [self initControllers:@[groupsMain, friendsMain]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
