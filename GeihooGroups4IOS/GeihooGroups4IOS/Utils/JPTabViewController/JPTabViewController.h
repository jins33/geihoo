//
//  JPTabViewController.h
//  JPTabViewController
//
//  Created by Jean-Philippe DESCAMPS on 19/03/2014.
//  Copyright (c) 2014 Jean-Philippe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemPrefixHeader.pch"

@protocol JPTabViewControllerDelegate <NSObject>

@optional
- (void)currentTabHasChanged:(NSInteger)selIndex;

@end

@interface JPTabViewController : UIViewController <UIScrollViewDelegate>
{
    NSInteger selectedTab;
}

@property (nonatomic, assign) id<JPTabViewControllerDelegate> delegate;
//标签高度
@property (nonatomic, assign) float menuHeight;
//标签字体
@property (nonatomic, assign) UIFont *titleFont;
//标签宽度
@property (nonatomic, assign) float tabWidth;
//标签页滚动视图
@property (nonatomic, strong) UIScrollView *contentScrollView;
//标签页控制器内容
@property (nonatomic, strong) NSArray *controllers;
//标签数组
@property (nonatomic, strong) NSMutableArray *tabs;
//灰色
@property (nonatomic, strong) UIColor *grayColor;
//标签颜色
@property (nonatomic, strong) UIColor *titleColor;
//状态栏高度
@property (nonatomic) float statusHeight;
//下划线视图
@property (nonatomic, strong) UIView *indicatorView;
//分割视图
@property (nonatomic, strong) UIView *bottomHeaderView;

- (id)initWithControllers:(NSArray *)controllers;

- (void)initControllers:(NSArray *)controllers;

- (void)selectTabNum:(NSInteger)index;

- (NSInteger)selectedTab;

@end
