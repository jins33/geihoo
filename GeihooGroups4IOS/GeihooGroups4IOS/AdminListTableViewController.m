//
//  AdminListTableViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/28.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "AdminListTableViewController.h"
static NSString * const reuseIdentifier = @"roleCell";
static NSString * const nibIdentifier = @"RoleTableViewCell";


@interface AdminListTableViewController ()

@end

@implementation AdminListTableViewController{
    NSArray *userNames, *roles, *userImgs;
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
    UIAlertView *alertView;
    if ([cell.roleLabel.text isEqualToString:@"族主"]) {
        alertView = [[UIAlertView alloc] initWithTitle:@"操作"message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"交接族主", @"查看个人主页", @"发消息", nil];
    }else{
        alertView = [[UIAlertView alloc] initWithTitle:@"操作"message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"取消管理员", @"删除成员", @"取消禁言", @"查看个人主页", @"发消息", nil];
    }
    [alertView show];
}

- (void)initData{
    userNames = @[@"王明敏", @"魏起亮", @"诸葛宁远"];
    roles = @[@"族主", @"管理员", @"管理员"];
    userImgs = @[@"tx1", @"tx2", @"tx3"];
}

- (void)initView{
    //注册tableViewCell
    UINib *cellNib = [UINib nibWithNibName:nibIdentifier bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:reuseIdentifier];
}

@end
