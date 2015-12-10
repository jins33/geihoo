//
//  MessageTableViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/23.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "MessageTableViewController.h"

@interface MessageTableViewController ()

@end

@implementation MessageTableViewController{
    NSMutableArray *userImageBtnArray;
    NSArray *userNameArray;
    NSArray *messageArray;
    NSArray *timeArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initData];
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
    MessageTableViewCell *cell = (MessageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"messageCell" forIndexPath:indexPath];
    //初始化用户头像
    cell.userImageBtn.originalImage = [UIImage imageNamed:[userImageBtnArray objectAtIndex:row]];
    [cell.userImageBtn initCircleImageView];
    //初始化用户名
    [cell.userNameLabel setText:[userNameArray objectAtIndex:row]];
    //初始化信息
    [cell.messageLabel setText:[messageArray objectAtIndex:row]];
    return cell;
}

- (void)initData{
    userNameArray = @[@"陈阿大", @"李阿二", @"张二狗", @"蒋中宁", @"赵丽琴", @"钱长江", @"周慧", @"吴幼林", @"王如是", @"魏明亮"];
    messageArray = @[@"在吗？", @"明天有空吗？", @"你好！", @"骚年，约吗？", @"现在在哪？", @"明天我去找你。", @"早上好！", @"嗯嗯。", @"我睡觉去了，晚安。", @"哈哈！"];
    userImageBtnArray = [NSMutableArray new];
    for (int i=0; i<10; i++) {
        [userImageBtnArray addObject:[NSString stringWithFormat:@"test_head_img_%d", i]];
    }
}

- (void)initView{
    //注册tableViewCell
    UINib *cellNib = [UINib nibWithNibName:@"MessageTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"messageCell"];
}

@end
