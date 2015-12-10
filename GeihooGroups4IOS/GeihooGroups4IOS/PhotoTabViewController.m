//
//  PhotoTabViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/9.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "PhotoTabViewController.h"

@interface PhotoTabViewController ()

@end

@implementation PhotoTabViewController

- (void)loadView{
    [super loadView];
    PhotoCollectionViewController *photoCollectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"photo"];
    [photoCollectionViewController setTitle:@"照片"];
    
    AlbumTableViewController *albumTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"album"];
    [albumTableViewController setTitle:@"相册"];
    [albumTableViewController setBaseController:_baseController];
    [self initControllers:@[photoCollectionViewController, albumTableViewController]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
