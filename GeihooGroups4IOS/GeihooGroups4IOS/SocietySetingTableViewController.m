//
//  SocietySetingTableViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/3.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "SocietySetingTableViewController.h"
static NSString * const reuseIdentifier = @"cell";

@interface SocietySetingTableViewController ()

@end

@implementation SocietySetingTableViewController{
    NSArray *options, *titles;
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return options.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return titles[section];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [options[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = options[section][row];
    if (section == 1 && row == 0) {
        UISwitch *sw=[[UISwitch alloc]init];
        cell.accessoryView = sw;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    UIViewController *editSocietyDataViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"editSocietyData"];
    UIViewController *editBackImgViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"editBackImg"];
    UIViewController *editHeadImgViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"editHeadImg"];
    UIAlertView *alertView;
    if (section == 0) {
        switch (row) {
            case 0:
                [self.navigationController pushViewController:editSocietyDataViewController animated:YES];
                break;
            case 1:
                [self.navigationController pushViewController:editBackImgViewController animated:YES];
                break;
            case 2:
                [self.navigationController pushViewController:editHeadImgViewController animated:YES];
                break;
            case 3:
                alertView = [[UIAlertView alloc] initWithTitle:@"操作"message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"公开", @"封闭", @"私密", nil];
                [alertView show];
                break;
            default:
                break;
        }
    }
}

- (void)initData{
    titles = @[@"基本项", @"发帖权限"];
    options = @[@[@"编辑族族名称和说明", @"更改封面照片", @"更改头像照片", @"隐私"], @[@"只有管理员才能发帖"]];
}

- (void)initView{
}

@end
