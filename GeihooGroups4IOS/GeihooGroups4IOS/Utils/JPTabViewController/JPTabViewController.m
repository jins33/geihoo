//
//  JPTabViewController.m
//  JPTabViewController
//
//  Created by Jean-Philippe DESCAMPS on 19/03/2014.
//  Copyright (c) 2014 Jean-Philippe. All rights reserved.
//

#import "JPTabViewController.h"

@interface JPTabViewController ()

@end

@implementation JPTabViewController

- (id)initWithControllers:(NSArray *)controllers
{
    if(self = [self init])
    {
        _controllers = controllers;
        selectedTab = NSIntegerMax;
        _delegate = nil;
        _indicatorView = [[UIView alloc] init];
    }
    return self;
}

- (void)initControllers:(NSArray *)controllers{
    _controllers = controllers;
    selectedTab = NSIntegerMax;
    _delegate = nil;
}

- (void)loadView{
    [super loadView];
    _grayColor = GRAY_COLOR;
    _titleColor = SYSTEM_COLOR;
    self.view.backgroundColor = [UIColor whiteColor];
    _indicatorView.backgroundColor= [UIColor blueColor];
    //    _statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    _statusHeight = 0;
    _titleFont = [UIFont systemFontOfSize:17];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (_controllers != nil)
    {
        [self loadUI];
    }
}

-(void)viewWillLayoutSubviews
{
    _contentScrollView.frame = CGRectMake(0.0,
                                          _menuHeight + _statusHeight,
                                          self.view.frame.size.width,
                                          self.view.frame.size.height-_menuHeight);
    
    for (int i=0; i < [_controllers count]; i++)
    {
        // Create content view
        UIViewController *controller = [_controllers objectAtIndex:i];
        
        [[controller view] setFrame:CGRectMake(i * _contentScrollView.frame.size.width,
                                               0.0,
                                               _contentScrollView.frame.size.width,
                                               _contentScrollView.frame.size.height)];
    }
    
    [_contentScrollView setContentSize:CGSizeMake(self.view.frame.size.width * [_controllers count], self.view.frame.size.height - _menuHeight - _statusHeight)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)loadUI
{
    _menuHeight = 40.0;
    
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0,_menuHeight + _statusHeight,
                                                                        self.view.frame.size.width,
                                                                        self.view.frame.size.height - _menuHeight -_statusHeight)];
    [_contentScrollView setPagingEnabled:YES];
    [_contentScrollView setDelegate:self];
    _contentScrollView.bounces = NO;
    _contentScrollView.showsHorizontalScrollIndicator = NO;
    _contentScrollView.showsVerticalScrollIndicator = NO;
    
    _tabWidth = self.view.frame.size.width / [_controllers count];
    _tabs = [[NSMutableArray alloc] init];
    for (int i=0; i < [_controllers count]; i++)
    {
        // Create content view
        UIViewController *controller = [_controllers objectAtIndex:i];
        
        [[controller view] setFrame:CGRectMake(i * _contentScrollView.frame.size.width,
                                               0.0,
                                               _contentScrollView.frame.size.width,
                                               _contentScrollView.frame.size.height)];
        [_contentScrollView addSubview:[controller view]];
        
        // Create button
        UIButton *tab = [[UIButton alloc] initWithFrame:CGRectMake(i * _tabWidth, _statusHeight, _tabWidth, _menuHeight)];
        [tab setTitle:controller.title forState:UIControlStateNormal];
        [tab setTitleColor:_grayColor forState:UIControlStateNormal];
        [tab setTitleColor:_titleColor forState:UIControlStateSelected];
        [tab.titleLabel setFont:_titleFont];
        [tab addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:tab];
        [_tabs addObject:tab];
        
        // Add separator
        if( i>0 )
        {
            UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(i*_tabWidth,
                                                                   10 + _statusHeight,
                                                                   1,
                                                                   20)];
            [sep setBackgroundColor:[UIColor colorWithWhite:0.7 alpha:1.0]];
            [self.view addSubview:sep];
        }
    }
    
    UIButton *tab = [_tabs objectAtIndex:0];
    [tab setSelected:YES];
    selectedTab = 0;
    _indicatorView.frame = CGRectMake(0.0, _menuHeight + _statusHeight - 5.0, _tabWidth, 5.0);
    [self.view addSubview:_indicatorView];
    
    _bottomHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0.0, _menuHeight - 1.0, self.view.frame.size.width, 1.0)];
    _bottomHeaderView.backgroundColor = RGB(200, 200, 200);
    [self.view addSubview:_bottomHeaderView];
    
    [self.view addSubview:_contentScrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x + (0.5f * width)) / width;
    float tabWidth = _indicatorView.frame.size.width;
    _indicatorView.frame = CGRectMake(page * tabWidth, _menuHeight + _statusHeight - 5.0, tabWidth, 5.0);
    [self deselectAllTabs];
    UIButton *tab = [_tabs objectAtIndex:page];
    [tab setSelected:YES];
}

- (void)selectTab:(id)sender
{
    selectedTab = [_tabs indexOfObject:sender];
    CGRect rect = CGRectMake(self.view.frame.size.width * selectedTab,
                             0.0,
                             self.view.frame.size.width,
                             _contentScrollView.contentSize.height);
    [_contentScrollView scrollRectToVisible:rect animated:YES];
    [self deselectAllTabs];
    [sender setSelected:YES];
    if(_delegate && [_delegate respondsToSelector:@selector(currentTabHasChanged:)] )
    {
        [_delegate currentTabHasChanged:selectedTab];
    }
}

- (void)deselectAllTabs
{
    for (UIButton *tab in _tabs)
    {
        [tab setSelected:NO];
    }
}

- (void)selectTabNum:(NSInteger)index
{
    if(index<0 || index>=[_tabs count])
    {
        return;
    }
    UIButton *tab = [_tabs objectAtIndex:index];
    [self selectTab:tab];
}

- (NSInteger)selectedTab
{
    return selectedTab;
}

@end
