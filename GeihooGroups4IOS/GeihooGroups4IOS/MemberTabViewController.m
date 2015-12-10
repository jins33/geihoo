//
//  MemberTabViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/29.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "MemberTabViewController.h"

@interface MemberTabViewController ()

@end

@implementation MemberTabViewController

- (void)loadView{
    [super loadView];
    MemberShipViewController *memberShipViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"memberShip"];
    [memberShipViewController setTitle:@"成员"];
    
    AdminListTableViewController *adminListTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"adnimList"];
    [adminListTableViewController setTitle:@"管理员/族主"];
    
    BannedTableViewController *bannedTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"bannedList"];
    [bannedTableViewController setTitle:@"禁言"];
    
    [self initControllers:@[memberShipViewController, adminListTableViewController, bannedTableViewController]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
