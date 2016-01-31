//
//  SocietyMainTableViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/8/31.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import "SocietyMainTableViewController.h"

@interface SocietyMainTableViewController ()

@end

@implementation SocietyMainTableViewController{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return postInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        SocietyPostBeans *societyPostBeans = [postInfoArray objectAtIndex:indexPath.row];
       SocietyPostsTableViewCell *cell = (SocietyPostsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"contentCell" forIndexPath:indexPath];
        //初始化用户头像
        cell.userImageBtn.originalImage = [UIImage imageNamed:[societyPostBeans userImage]];
        [cell.userImageBtn initCircleImageView];
        //初始化用户名
        [cell.userNameLabel setText:[societyPostBeans userName]];
        //初始化用户社团及发帖时间
        [cell.postProLabel setText:[societyPostBeans postPro]];
        //初始化帖子文字内容
        [cell.postDescriptionTextView setText:[societyPostBeans postDescription]];
        cell.postDescriptionTextView.font = [UIFont systemFontOfSize:15];
        //初始化帖子图片
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *image = [UIImage imageNamed:[societyPostBeans postImage]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [cell.postImageView setImage:image];
            });
        });
        //通过ReactiveCocoa注册commentBtn点击事件
        cell.commentBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SocietyMain" bundle:nil];
            UITableViewController *tableViewController = [storyboard instantiateViewControllerWithIdentifier:@"postDetail"];
            [self.navigationController pushViewController:tableViewController animated:YES];
            return [RACSignal empty];
        }];
        return cell;
}

-(void)initView{
    //注册tableViewCell
    UINib *cellNib = [UINib nibWithNibName:@"SocietyPostsTableViewCell" bundle:nil];
    [_postTableView registerNib:cellNib forCellReuseIdentifier:@"contentCell"];
    
    //添加_memberView点击事件
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showMemberInfo:)];
    [_memberView addGestureRecognizer:tapGesture];
    
    //添加上拉刷新
     _postTableView.mj_header = ({
         MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
             [_postTableView.mj_header endRefreshing];
         }];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        header;
    });
}

-(void)initData{
    
    NSString *postType = [SystemParaManager getPostType];
    if (postType && [postType isEqualToString:@"friends"]) {
        _headerView.frame = CGRectMake(0, 0, 320, 295);
        [_topMessView setHidden:YES];
    }else{
        _headerView.frame = CGRectMake(0, 0, 320, 326);
        [_topMessView setHidden:NO];
    }
    
    postInfoArray = [NSMutableArray new];
    userNameArray = @[@"游戏主角", @"旅人", @"萝莉一号", @"萌萌哒", @"死神来了",
                      @"小鲜肉", @"恐高的鹿", @"胖子", @"皮卡皮卡", @"阿狸"];
    postDescriptionArray = @[
        @"此松是黄山松的代表，乃至整个黄山的象征，它恰似一位好客的主人，挥展双臂，热情欢迎海内外宾客来黄山游览。",
        @"丽江古城，又名“大研古镇”，海拔2400米，是丽江纳西族自治县的中心城市，是中国历史文化名城之一，世界文化遗产，国家5A级旅游...",
        @"布达拉宫位于中国西藏自治区首府拉萨市区西北的玛布日山上，是一座宫堡式建筑群，最初是吐蕃王朝赞普松赞干布为迎娶尺尊公主和...",
        @"北京故宫，旧称为紫禁城，是中国古代汉族宫殿建筑之精华，无与伦比的建筑杰作，也是世界上现存规模最大、保存最为完整的木质结...",
        @"长城修筑的历史可上溯到西周时期，周王朝为了防御北方游牧民族俨狁的袭击，曾筑连续排列的城堡“列城”以作防御。",
        @"武夷山位于福建省武夷山市南郊，武夷山脉北段东南麓总面积999.75平方公里，是中国著名的风景旅游区和避暑胜地。",
        @"九寨沟国家级自然保护区位于四川省阿坝藏族羌族自治州九寨沟县境内，是中国第一个以保护自然风景为主要目的的自然保护区，同时...",
        @"泰山（Mount Tai），世界文化与自然双重遗产 ，世界地质公园，全国重点文物保护单位，国家重点风景名胜区，国家AAAAA级旅游景...",
        @"三亚（Sanya ）位于海南岛的最南端，是中国最南部的热带滨海旅游城市，是中国空气质量最好的城市、全国最长寿地区。",
        @"桂林是世界著名的旅游城市、中国首批国家历史文化名城、中国优秀旅游城市，其境内的山水风光举世闻名，千百年来享有“桂林山水甲..."
    ];
    SocietyPostBeans *societyPostBeans;
    
    for (int i=0; i < 10; i++) {
        societyPostBeans = [SocietyPostBeans initUserImage:[NSString stringWithFormat:@"test_head_img_%d", i] andUserName:[userNameArray objectAtIndex:i] andPostPro:[NSString stringWithFormat:@"旅行社 8月%d日", 30-i] andPostDescription:[postDescriptionArray objectAtIndex:i] andPostImage:[NSString stringWithFormat:@"test_content_img_%d", i]];
        [postInfoArray addObject:societyPostBeans];
    }
}

- (void)showMemberInfo:(id)sender{
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"memberControl"];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
