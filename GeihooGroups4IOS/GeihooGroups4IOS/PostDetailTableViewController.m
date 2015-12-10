//
//  PostDetailTableViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/25.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "PostDetailTableViewController.h"
static NSString * const reuseIdentifier = @"commentCell";

@interface PostDetailTableViewController ()

@end

@implementation PostDetailTableViewController{
    NSArray *userNames, *comments;
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
    return comments.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.userNameLabel.text = userNames[row];
    cell.commentLabel.text = comments[row];
    return cell;
}

- (void)initData{
    userNames = @[@"小红：", @"小明：", @"小明回复小红："];
    comments = @[@"呵呵", @"你妹，出去玩也没带上我！", @"没错，没心没肺。"];
}

- (void)initView{
    _headerView.frame = CGRectMake(0, 0, 320, 414);
}

- (IBAction)showPop:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"操作"message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"收藏", @"编辑帖子", @"置顶", @"删除", @"举报", nil];
    [alertView show];
}
@end
