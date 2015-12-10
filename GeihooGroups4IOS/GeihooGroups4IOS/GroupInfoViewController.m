//
//  GroupInfoViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/23.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "GroupInfoViewController.h"

@interface GroupInfoViewController ()

@end

@implementation GroupInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createGroup:(id)sender {
    //设置即将跳转的页面类型
    [SystemParaManager setPostType:@"groups"];
    
    //页面跳转
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Society" bundle:[NSBundle mainBundle]];
    UITabBarController *tabBarController = [storyboard instantiateInitialViewController];
    [self presentViewController:tabBarController animated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)cancelCreate:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
