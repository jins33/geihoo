//
//  UIViewController+Addition.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/13.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "UIViewController+Addition.h"

@implementation UIViewController (Addition)

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)actionDone:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
