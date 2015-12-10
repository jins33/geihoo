//
//  RootViewController.m
//  GeihooGroups
//
//  Created by hjs on 15/8/19.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)awakeFromNib
{
//    self.contentViewShadowColor = [UIColor blackColor];
//    self.contentViewShadowOffset = CGSizeMake(0, 0);
//    self.contentViewShadowRadius = 12;
//    self.contentViewShadowEnabled = YES;
    
    self.contentViewShadowOpacity = 0.5;
    self.contentViewShadowColor = [UIColor blackColor];
    self.backgroundImage = [UIImage imageNamed:@"slidingmenu_bg"];

    self.parallaxEnabled = YES;
    self.scaleContentView = YES;
    self.contentViewScaleValue = 0.93;
    self.scaleMenuView = NO;
    self.contentViewShadowEnabled = YES;
    self.contentViewShadowRadius = 4.5;
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftMenuViewController"];
    //self.rightMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"rightMenuViewController"];
    self.delegate = self;
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
