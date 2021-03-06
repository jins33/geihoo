//
//  ActivityTabViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/13.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "ActivityTabViewController.h"

@interface ActivityTabViewController ()

@end

@implementation ActivityTabViewController

- (void)loadView{
    [super loadView];
    PresentActivityTableViewController *presentActivityTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"presentActivity"];
    [presentActivityTableViewController setTitle:@"活动预告"];
    presentActivityTableViewController.baseController = _baseController;
    
    PastActivityTableViewController *pastActivityTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pastActivity"];
    [pastActivityTableViewController setTitle:@"往期活动"];
    pastActivityTableViewController.baseController = _baseController;
    
    [self initControllers:@[presentActivityTableViewController, pastActivityTableViewController]];
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
