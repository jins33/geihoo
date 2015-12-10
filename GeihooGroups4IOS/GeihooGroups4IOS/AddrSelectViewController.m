//
//  AddrSelectViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/3.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "AddrSelectViewController.h"
static NSString * const reuseIdentifier = @"cell";

@interface AddrSelectViewController ()

@end

@implementation AddrSelectViewController{
    NSArray *addrs, *addrImgs, *distances;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return addrs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = addrs[row];
    cell.detailTextLabel.text = distances[row];
    UIImage *image = [UIImage imageNamed:addrImgs[row]];
    cell.imageView.image = [image ringImageWithSize:CGSizeMake(50, 50)];
    return cell;
}

- (void)initData{
    addrs = @[@"福州市鼓楼区五凤街道丞相坊小区", @"福州市晋安区鼓山路鼓山风景区", @"福州市鼓楼区湖滨路西湖公园"];
    addrImgs = @[@"tx1", @"tx2", @"tx3"];
    distances = @[@"小于1km", @"3km", @"10km"];
}

- (void)initView{
    
}

@end
