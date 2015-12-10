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
    
    GroupsCollectionViewController *groupsType1 = [self.storyboard instantiateViewControllerWithIdentifier:@"groupsType"];
    [groupsType1 setTitle:@"常用（8）"];
    [groupsType1 setBaseController:_baseController];
    
    GroupsCollectionViewController *groupsType2 = [self.storyboard instantiateViewControllerWithIdentifier:@"groupsType"];
    [groupsType2 setTitle:@"私密（8）"];
    [groupsType2 setBaseController:_baseController];
    
    GroupsCollectionViewController *groupsType3 = [self.storyboard instantiateViewControllerWithIdentifier:@"groupsType"];
    [groupsType3 setTitle:@"公开（8）"];
    [groupsType3 setBaseController:_baseController];
    
    [self initControllers:@[groupsType1, groupsType2, groupsType3]];
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
