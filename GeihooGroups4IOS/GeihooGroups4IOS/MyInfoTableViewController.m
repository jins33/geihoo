//
//  MyInfoTableViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/30.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "MyInfoTableViewController.h"

@interface MyInfoTableViewController ()

@end

@implementation MyInfoTableViewController{
    NSArray *tableData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KeyValueBean * keyValueBean = tableData[indexPath.section][indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    cell.textLabel.text = keyValueBean.key;
    cell.detailTextLabel.text = keyValueBean.value;
    return cell;
}

-(void)initData{
    
    NSMutableArray *data = [NSMutableArray new];
    NSArray *titleArray = @[@"昵称", @"性别", @"地区", @"简介", @"我的主页"];
    NSArray *detailArray = @[@"小女子", @"女", @"福建福州", @"我是个有点冲动的女孩", @""];
    for (int i=0; i<titleArray.count; i++) {
        KeyValueBean *keyValueBean = [KeyValueBean new];
        keyValueBean.key = titleArray[i];
        keyValueBean.value = detailArray[i];
        [data addObject:keyValueBean];
    }
    tableData = @[@[data[0]], @[data[1], data[2], data[3]], @[data[4]]];
}

-(void)initView{
}

@end
