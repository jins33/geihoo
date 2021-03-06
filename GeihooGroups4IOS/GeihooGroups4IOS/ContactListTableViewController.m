//
//  ContactListTableViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/23.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "ContactListTableViewController.h"

@interface ContactListTableViewController ()

@end

@implementation ContactListTableViewController{
    NSMutableArray *userImageBtnArray;
    NSArray *userNameArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initData];
}

- (void)viewDidDisappear:(BOOL)animated{
    //视图消失时让_searchBar失去焦点
    [_searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    long row = indexPath.row;
    ContactListTableViewCell *cell = (ContactListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"contactCell" forIndexPath:indexPath];
    //初始化用户头像
    cell.userImageBtn.originalImage = [UIImage imageNamed:[userImageBtnArray objectAtIndex:row]];
    [cell.userImageBtn initCircleImageView];
    //初始化用户名
    [cell.userNameLabel setText:[userNameArray objectAtIndex:row]];
    return cell;
}

#pragma mark -数据视图初始化
- (void)initData{
    userNameArray = @[@"陈阿大", @"李阿二", @"张二狗", @"蒋中宁", @"赵丽琴", @"钱长江", @"周慧", @"吴幼林", @"王如是", @"魏明亮"];
    userImageBtnArray = [NSMutableArray new];
    for (int i=0; i<10; i++) {
        [userImageBtnArray addObject:[NSString stringWithFormat:@"test_head_img_%d", i]];
    }
}

- (void)initView{
    //注册tableViewCell
    UINib *cellNib = [UINib nibWithNibName:@"ContactListTableViewCell" bundle:nil];
    [_contactsTableView registerNib:cellNib forCellReuseIdentifier:@"contactCell"];
}

@end
