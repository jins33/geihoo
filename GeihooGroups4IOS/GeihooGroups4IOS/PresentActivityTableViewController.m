//
//  PresentActivityTableViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/12.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "PresentActivityTableViewController.h"
static NSString * const viewIdentifier = @"activityDetail";

@interface PresentActivityTableViewController ()

@end

@implementation PresentActivityTableViewController{
    NSMutableArray *activityImageArray;
    NSArray *titleArray, *timeArray, *placeArray, *organiserArray, *peopleNumArray;
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
    return [activityImageArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activityCell" forIndexPath:indexPath];
    cell.activityImageView.originalImage = [UIImage imageNamed:[activityImageArray objectAtIndex:indexPath.row]];
    [cell.activityImageView initCircleImageView];
    [cell.titleLabel setText:[titleArray objectAtIndex:indexPath.row]];
    [cell.timeLabel setText:[timeArray objectAtIndex:indexPath.row]];
    [cell.placeLabel setText:[placeArray objectAtIndex:indexPath.row]];
    [cell.organiserLabel setText:[organiserArray objectAtIndex:indexPath.row]];
    [cell.peopleNumLabel setText:[peopleNumArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityDetailViewController *activityDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:viewIdentifier];
    [_baseController.navigationController pushViewController:activityDetailViewController animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"8月";
}

- (void)initData{
    activityImageArray = [NSMutableArray new];
    for (int i=5; i<10; i++) {
        [activityImageArray addObject:[NSString stringWithFormat:@"test_head_img_%d", i]];
    }
    titleArray = @[@"爬山", @"聚餐", @"羽毛球", @"足球", @"篮球"];
    timeArray = @[@"8月11日", @"8月6日", @"8月5日", @"8月3日", @"8月1日"];
    placeArray = @[@"鼓山", @"宝龙城市广场", @"省体", @"省体", @"省体"];
    organiserArray = @[@"钱长江", @"周慧", @"吴幼林", @"王如是", @"魏明亮"];
    peopleNumArray = @[@"人数:10", @"人数:8", @"人数:6", @"人数:30", @"人数:20"];
}

- (void)initView{
    //注册tableViewCell
    UINib *cellNib = [UINib nibWithNibName:@"ActivityTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"activityCell"];
}

@end
