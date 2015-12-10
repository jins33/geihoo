//
//  FileTabViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/8.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "FileTabViewController.h"

@interface FileTabViewController ()

@end

@implementation FileTabViewController

- (void)loadView{
    [super loadView];
    FileViewController *filesByTimeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"filesByTime"];
    [filesByTimeViewController setTitle:@"时间"];
    
    FileViewController *filesByTypeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"filesByType"];
    [filesByTypeViewController setTitle:@"类型"];
    
    FileViewController *filesByUserViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"filesByUser"];
    [filesByUserViewController setTitle:@"上传者"];
    
    [self initControllers:@[filesByTimeViewController, filesByTypeViewController, filesByUserViewController]];
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
