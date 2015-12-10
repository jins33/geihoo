//
//  MemberShipViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/29.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "MemberShipViewController.h"
static NSString * const reuseIdentifier = @"roleCell";
static NSString * const nibIdentifier = @"RoleTableViewCell";

@interface MemberShipViewController ()

@end

@implementation MemberShipViewController{
    NSArray *topUserNames, *bottomUserNames, *topRoles, *bottomRoles, *topUserImgs, *bottomUserImgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView 代理
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if ([tableView isEqual:_topTableView]) {
        return @"好友";
    }else{
        return @"其他成员";
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual: _topTableView]) {
        return topUserNames.count;
    } else {
        return bottomUserNames.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if ([tableView isEqual: _topTableView]) {
        RoleTableViewCell *topCell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
        topCell.userNameLabel.text = topUserNames[row];
        topCell.roleLabel.text = topRoles[row];
        topCell.userImg.originalImage = [UIImage imageNamed:topUserImgs[row]];
        [topCell.userImg initCircleImageView];
        return topCell;
    }else{
        RoleTableViewCell *bottomCell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
        bottomCell.userNameLabel.text = bottomUserNames[row];
        bottomCell.roleLabel.text = bottomRoles[row];
        bottomCell.userImg.originalImage = [UIImage imageNamed:bottomUserImgs[row]];
        [bottomCell.userImg initCircleImageView];
        return bottomCell;
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    RoleTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *roleStr = cell.roleLabel.text;
    if ([roleStr isEqualToString:@"族主"]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"操作"message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"交接族主", @"查看个人主页", @"发消息", nil];
        [alertView show];
    }else{
        NSString *roleSetStr = [roleStr isEqualToString:@"管理员"]?@"取消管理员":@"设为管理员";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"操作"message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:roleSetStr, @"删除成员", @"禁言", @"查看个人主页", @"发消息", nil];
        [alertView show];
    }
}

#pragma mark - 初始化数据、视图
-(void)initData{
    topUserNames = @[@"诸葛宁远", @"李广宏", @"周凤山"];
    bottomUserNames = @[@"王明敏", @"魏起亮", @"黄先明", @"李思明", @"黄文明", @"王嘉时"];
    topRoles = @[@"管理员", @"", @""];
    bottomRoles = @[@"族主", @"管理员", @"", @"", @"", @""];
    topUserImgs = @[@"tx1", @"tx2", @"tx3"];
    bottomUserImgs = @[@"tx1", @"tx2", @"tx3", @"tx4", @"tx5", @"tx6"];
}

-(void)initView{
    //注册tableViewCell
    UINib *cellNib = [UINib nibWithNibName:nibIdentifier bundle:nil];
    [_topTableView registerNib:cellNib forCellReuseIdentifier:reuseIdentifier];
    [_bottomTableView registerNib:cellNib forCellReuseIdentifier:reuseIdentifier];
}


@end
