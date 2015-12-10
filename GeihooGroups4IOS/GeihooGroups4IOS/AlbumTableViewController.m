//
//  AlbumTableViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/14.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "AlbumTableViewController.h"

@implementation AlbumTableViewController{
    NSMutableArray *albumPhotoArray, *albumNameArray, *photoNumArray;
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
    return albumPhotoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    long row = indexPath.row;
    AlbumTableViewCell *cell = (AlbumTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"albumCell" forIndexPath:indexPath];
    cell.albumPhotoImageView.image = [UIImage imageNamed:albumPhotoArray[row]];
    cell.albumNameLabel.text = albumNameArray[row];
    cell.photoNumLabel.text = photoNumArray[row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"photoDetail"];
    [((UIViewController *)_baseController).navigationController pushViewController:viewController animated:YES];
}

- (void)initData{
    albumPhotoArray = [NSMutableArray new];
    albumNameArray = [NSMutableArray new];
    photoNumArray = [NSMutableArray new];
    for (int i = 0; i < 5; i++) {
        [albumPhotoArray addObject:[NSString stringWithFormat:@"test_head_img_%d", i]];
        [albumNameArray addObject:[NSString stringWithFormat:@"我的相册%d", i]];
        [photoNumArray addObject:[NSString stringWithFormat:@"%d张照片", 20 + i]];
    }
}

- (void)initView{
}

@end
