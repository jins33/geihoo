//
//  TrendsViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/24.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SocietyPostsTableViewCell.h"
#import "SocietyPostBeans.h"
#import "SystemPrefixHeader.pch"

@interface TrendsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *postInfoArray;
    NSArray *userNameArray;
    NSArray *postDescriptionArray;
}

@property (weak, nonatomic) IBOutlet UITableView *postTableView;

@end
