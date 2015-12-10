//
//  HeadView.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/8.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommonCellBeanGroup;

@protocol HeadViewDelegate <NSObject>

@optional
- (void)clickHeadView;

@end

@interface HeadView : UITableViewHeaderFooterView

@property (nonatomic, strong) CommonCellBeanGroup *commonCellBeanGroup;

@property (nonatomic, weak) id<HeadViewDelegate> delegate;

+ (instancetype)headViewWithTableView:(UITableView *)tableView;

@end
