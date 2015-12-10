//
//  MeViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/28.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController{
    NSArray *imageArray, *nameArray;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [imageArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [imageArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BasicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
    
    //初始化图片
    UIImage *image = [UIImage imageNamed:imageArray[indexPath.section][indexPath.row]];
    [cell.imgView setImage:image];
    //初始化文字
    [cell.txLabel setText:nameArray[indexPath.section][indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    if (section == 0 && row == 0) {
        //我的主页
        UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"myPage"];
        [self.navigationController pushViewController:viewController animated:YES];
    }else if (section == 0 && row == 1){
        //我的消息
        UITableViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"myInfo"];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (void)initData{
    imageArray = @[@[@"me_home", @"me_mes"], @[@"me_collect", @"me_friend", @"me_set"]];
    nameArray = @[@[@"我的主页", @"我的消息"], @[@"我的收藏", @"我的活动", @"设置"]];
}

- (void)initView{
    //添加_headerView点击事件
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showUserInfo:)];
    
    [_headerView addGestureRecognizer:tapGesture];
    
    //注册tableViewCell
    UINib *cellNib = [UINib nibWithNibName:@"BasicTableViewCell" bundle:nil];
    [_meTableView registerNib:cellNib forCellReuseIdentifier:@"basicCell"];
}

-(void)showUserInfo:(id)sender{
    MyInfoTableViewController *myInfoTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"myView"];
    [self.navigationController pushViewController:myInfoTableViewController animated:YES];
}
@end
