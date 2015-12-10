//
//  ActivityMainViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/30.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "ActivityMainViewController.h"

@implementation ActivityMainViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"activityTab"]) {
        ActivityTabViewController *activityTabViewController = (ActivityTabViewController *)segue.destinationViewController;
        activityTabViewController.baseController = self;
    }
}

@end
