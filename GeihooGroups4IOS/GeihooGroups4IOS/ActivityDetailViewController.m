//
//  ActivityDetailViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/30.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "ActivityDetailViewController.h"
static NSString * const reuseIdentifier = @"cell";


@implementation ActivityDetailViewController{
    NSArray *userImgs, *userNames;
}

- (void)viewDidLoad{
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
    return userNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.imageView.image = [[UIImage imageNamed:userImgs[row]] ringImageWithSize:CGSizeMake(40, 40)];
    cell.textLabel.text = userNames[row];
    return cell;
}

- (void)initData{
    userNames = @[@"王明敏", @"魏起亮", @"诸葛宁远", @"李广宏", @"周凤山"];
    userImgs = @[@"tx1", @"tx2", @"tx3", @"tx4", @"tx5"];
}

- (void)initView{
}


@end
