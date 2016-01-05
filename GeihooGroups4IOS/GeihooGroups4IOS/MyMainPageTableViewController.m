//
//  MyMainPageTableViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/29.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "MyMainPageTableViewController.h"
static NSString * const picCellIdentifier = @"picCell";
static NSString * const mainPageCellIdentifier = @"mainPageCell";

@interface MyMainPageTableViewController ()

@end

@implementation MyMainPageTableViewController{
    NSArray *picImages, *dates, *details, *albumImgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _picTableView) {
        return picImages.count;
    }else{
        return dates.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (tableView == _picTableView) {
        PicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:picCellIdentifier forIndexPath:indexPath];
        cell.picImage.image = [UIImage imageNamed:picImages[row]];
        cell.transform = CGAffineTransformMakeRotation(M_PI / 2);
        return cell;
    }else{
        MyMainPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainPageCellIdentifier forIndexPath:indexPath];
        cell.dateLabel.text = dates[row];
        cell.detailLabel.text = details[row];
        cell.imageNames = albumImgs;
        [cell initData];
        [cell initView];
        return cell;
    }
}


//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (tableView == _picTableView) {
//        return 68;
//    }else{
//        return 150;
//    }
//}

- (void)initData{
    picImages = @[@"imgs_demo", @"imgs_demo2", @"imgs_demo", @"imgs_demo2", @"imgs_demo", @"imgs_demo2", @"imgs_demo", @"imgs_demo2", @"imgs_demo", @"imgs_demo2", @"imgs_demo", @"imgs_demo2"];
    dates = @[@"今天", @"11月10日", @"11月9日"];
    details = @[@"人生不止眼前的苟且，还有诗与远方。", @"吾生也有涯 而知也无涯。", @"稻花香里说丰年，听取蛙声一片。"];
    albumImgs = @[@"tx1", @"tx2", @"tx3", @"tx4", @"tx5", @"tx6", @"tx7", @"tx8", @"tx9"];
}

- (void)initView{
    [_horizontalView.superview layoutSubviews];
    CGFloat height = _horizontalView.frame.size.height;
    _picTableView = [UITableView new];
    //通过Nib生成cell，然后注册 Nib的view需要继承 UITableCell
    [_picTableView registerNib:[UINib nibWithNibName:@"PicTableViewCell" bundle:nil] forCellReuseIdentifier:picCellIdentifier];
    [_horizontalView addSubview:_picTableView];
    //指定_picTableView高度
    _picTableView.rowHeight = 68;
    //指定tableView大概高度
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    //_picTableView逆时针旋转90度。
    _picTableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    _picTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH-16, height);
    _picTableView.showsVerticalScrollIndicator = NO;
    _picTableView.showsHorizontalScrollIndicator = NO;
    _picTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _picTableView.delegate = self;
    _picTableView.dataSource = self;
}

@end
