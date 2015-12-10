//
//  GroupSetingViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/23.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "GroupSetingViewController.h"
static NSString * const cellIdentifier = @"typeCell";

@interface GroupSetingViewController ()

@end

@implementation GroupSetingViewController{
    NSArray *typeNames, *subTitles;
    NSInteger currentRow;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -tableView 代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return typeNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    UITableViewCell *cell = [_typeTableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = typeNames[row];
    cell.detailTextLabel.text = subTitles[row];
    if(currentRow==row){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath{
    currentRow=indexPath.row;
    [_typeTableView reloadData];
}

#pragma mark -数据视图初始化
-(void)initView{
}

-(void)initData{
    typeNames = @[@"私密", @"封闭", @"公开"];
    subTitles = @[@"只能被内部成员找到，并查看发布内容", @"能被找到，并能查看其成员，但只有成员能看到发帖", @"能被找到，并能查看其成员和发帖"];
}
@end
