//
//  BannedTableViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/29.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "BannedTableViewController.h"
static NSString * const reuseIdentifier = @"roleCell";
static NSString * const nibIdentifier = @"RoleTableViewCell";

@interface BannedTableViewController ()

@end

@implementation BannedTableViewController{
    NSArray *userNames, *roles, *userImgs;
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

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return roles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    RoleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.userNameLabel.text = userNames[row];
    cell.roleLabel.text = roles[row];
    cell.userImg.originalImage = [UIImage imageNamed:userImgs[row]];
    [cell.userImg initCircleImageView];
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    RoleTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *roleSetStr = [cell.roleLabel.text isEqualToString:@"管理员"]?@"取消管理员":@"设为管理员";
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"操作"message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:roleSetStr, @"删除成员", @"取消禁言", @"查看个人主页", @"发消息", nil];
    [alertView show];
}

- (void)initData{
    userNames = @[@"黄先明", @"赵光明", @"朱平"];
    roles = @[@"", @"", @"管理员"];
    userImgs = @[@"tx1", @"tx2", @"tx3"];
}

- (void)initView{
    //注册tableViewCell
    UINib *cellNib = [UINib nibWithNibName:nibIdentifier bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:reuseIdentifier];
}

@end
