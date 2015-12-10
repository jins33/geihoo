//
//  AddActivityViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/1.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "AddActivityViewController.h"

static NSString * const reuseIdentifier = @"activityCell";
static NSString * const viewControllerIdentifier = @"addrSelect";


@implementation AddActivityViewController{
    NSArray *optionNames, *optionImgs;
    NSMutableArray *optionTimes;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return optionNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:optionImgs[row]];
    cell.textLabel.text = optionNames[row];
    cell.detailTextLabel.text = optionTimes[row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if ([optionNames[row] isEqualToString:@"活动地点"]) {
        UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:viewControllerIdentifier];
        [self.navigationController pushViewController:viewController animated:YES];
    }else{
        //初始化日期控件
        MyDatePickerView *myDatePickerView = [[MyDatePickerView alloc]init];
        myDatePickerView.block = ^(MyDatePickerView *view, UIButton *btn, NSString *dateStr){
            optionTimes[row] = dateStr;
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
        [myDatePickerView show];
    }
}

- (void)initData{
    optionNames = @[@"报名开始时间", @"报名结束时间", @"活动结束时间", @"活动结束时间", @"活动地点"];
    optionImgs = @[@"icon_time", @"clear_pic", @"icon_time", @"clear_pic", @"icon_site"];
    optionTimes = [NSMutableArray arrayWithArray:@[@"", @"", @"", @"", @""]];
}

- (void)initView{
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    _activityTableView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, CGRectGetHeight(self.tabBarController.tabBar.frame), 0.0f);
    _activityInfo.layer.backgroundColor = [[UIColor clearColor] CGColor];
    _activityInfo.layer.borderColor = [[UIColor grayColor] CGColor];
    _activityInfo.layer.borderWidth = 0.5;
    _activityInfo.layer.cornerRadius = 8.0f;
    [_activityInfo.layer setMasksToBounds:YES];
    _headerView.frame = CGRectMake(0, 0, 320, 243);
}

@end
