//
//  PhotoMainViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/26.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "PhotoMainViewController.h"

@interface PhotoMainViewController ()

@end

@implementation PhotoMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"photoTab"]) {
        PhotoTabViewController *photoTabViewController = segue.destinationViewController;
        [photoTabViewController setBaseController:self];
    }
}

@end
