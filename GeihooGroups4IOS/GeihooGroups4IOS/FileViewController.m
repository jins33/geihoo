//
//  FileViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/8.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "FileViewController.h"
#import "CommonCellBeanGroup.h"
#import "CommonCellBean.h"
#import "HeadView.h"

@interface FileViewController () <HeadViewDelegate>
{
    NSArray *_commonCellBeansData;
}
@end

@implementation FileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.title = @"好友列表";
    self.tableView.sectionHeaderHeight = 40;
    
    [self loadData];
}

#pragma mark 加载数据
- (void)loadData
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:_plistName withExtension:nil];
    NSArray *tempArray = [NSArray arrayWithContentsOfURL:url];
    
    NSMutableArray *fgArray = [NSMutableArray array];
    for (NSDictionary *dict in tempArray) {
        CommonCellBeanGroup *commonCellBeanGroup = [CommonCellBeanGroup commonCellBeanGroupWithDict:dict];
        [fgArray addObject:commonCellBeanGroup];
    }
    
    _commonCellBeansData = fgArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _commonCellBeansData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CommonCellBeanGroup *commonCellBeanGroup = _commonCellBeansData[section];
    NSInteger count = commonCellBeanGroup.isOpened ? commonCellBeanGroup.commonCellBeans.count : 0;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    CommonCellBeanGroup *commonCellBeanGroup = _commonCellBeansData[indexPath.section];
    CommonCellBean *commonCellBean = commonCellBeanGroup.commonCellBeans[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:commonCellBean.icon];
//    cell.textLabel.textColor = commonCellBean.isVip ? [UIColor redColor] : [UIColor blackColor];
    cell.textLabel.text = commonCellBean.name;
    cell.detailTextLabel.text = commonCellBean.intro;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
    cell.accessoryView = button;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeadView *headView = [HeadView headViewWithTableView:tableView];
    
    headView.delegate = self;
    headView.commonCellBeanGroup = _commonCellBeansData[section];
    
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

- (void)clickHeadView
{
    [self.tableView reloadData];
}

@end
