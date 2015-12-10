//
//  ContactsTabViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/22.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "ContactsTabViewController.h"

@interface ContactsTabViewController ()

@end

@implementation ContactsTabViewController

- (void)loadView{
    [super loadView];
    MessageTableViewController *messageTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"message"];
    [messageTableViewController setTitle:@"信息"];
    
    ContactListTableViewController *contactListTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contactList"];
    [contactListTableViewController setTitle:@"通讯录"];
    
    [self initControllers:@[messageTableViewController, contactListTableViewController]];
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
