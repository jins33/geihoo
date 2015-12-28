//
//  FriendsMainViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/11.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import "FriendsMainViewController.h"
static NSString* const kcellIdentifier = @"mainConllectionCell";
static NSString* const kheaderIdentifier = @"headerIdentifier";
static NSString* const resultsIdentifier = @"results";
static NSString* const reuseIdentifier = @"contentCell";

@interface FriendsMainViewController ()

@end

@implementation FriendsMainViewController{
    //collectionView 变量
    NSArray *friendTypeNames;
    NSMutableArray *societyImages, *data, *friendsTypeData;
    CGFloat cellSpace, footHeight;
    NSNumber *imageType;
    //tableView 变量
    NSMutableArray *postInfoArray;
    NSArray *userNameArray, *postDescriptionArray;
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

#pragma mark - tableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return postInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SocietyPostBeans *societyPostBeans = [postInfoArray objectAtIndex:indexPath.row];
    SocietyPostsTableViewCell *cell = (SocietyPostsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
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
    [cell.postImageView setImage:[UIImage imageNamed:[societyPostBeans postImage]]];
    //通过ReactiveCocoa注册commentBtn点击事件
    [[cell.commentBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SocietyMain" bundle:nil];
         UITableViewController *tableViewController = [storyboard instantiateViewControllerWithIdentifier:@"postDetail"];
         [self.navigationController pushViewController:tableViewController animated:YES];
     }];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    GroupsCellHeaderCollectionReusableView *tableHeaderView = [GroupsCellHeaderCollectionReusableView new];
    tableHeaderView.societyTypeLabel.text = @"所有动态";
    tableHeaderView.editCommonGroupsBtn.hidden = YES;
    return tableHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

#pragma mark -collectionView 代理方法
//定义UICollectionView item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return friendsTypeData.count;
}

//定义UICollectionViewCell内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    long row = indexPath.row;
    CGSize cellSize = [self cellSize];
    GroupsMainCollectionViewCell *cell = (GroupsMainCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kcellIdentifier forIndexPath:indexPath];
    CircleImageView *circleImageView = cell.societyIconImageView;
    SocietyBean *societyBean = friendsTypeData[row];
    circleImageView.originalImage = [UIImage imageNamed:societyBean.societyImage];
    circleImageView.imageType = imageType;
    circleImageView.originalImageSize = CGSizeMake(cellSize.width, cellSize.width);
    cell.societyNameTextView.text = societyBean.societyName;
    [circleImageView initCircleImageView];
    return cell;
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self cellSize];
}

//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, cellSpace, 0, cellSpace);//分别为上、左、下、右
}

//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return cellSpace;
}

//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(320, 30);
}


//初始化headerView footerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString *headerText = @"朋友圈（7）";
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]){
        GroupsCellHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:kheaderIdentifier   forIndexPath:indexPath];
        headerView.societyTypeLabel.text = headerText;
        return headerView;
    }
    return nil;
}

#pragma mark -数据视图初始化
-(void)initView{
    //通过Nib生成cell，然后注册 Nib的view需要继承 UICollectionViewCell
    [_friendCollectionView registerNib:[UINib nibWithNibName:@"GroupsMainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kcellIdentifier];
    //注册headerView Nib的view需要继承UICollectionReusableView
    [_friendCollectionView registerNib:[UINib nibWithNibName:@"GroupsCellHeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kheaderIdentifier];
    
    //注册tableViewCell
    UINib *cellNib = [UINib nibWithNibName:@"SocietyPostsTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:reuseIdentifier];
}

-(void)initData{
    //collectionView据初始化
    cellSpace = FRIEND_ITEMS_SPACE;
    footHeight = 30;
    imageType = @1;
    
    data = [NSMutableArray array];
    societyImages  = [NSMutableArray array];
    friendsTypeData = [NSMutableArray array];
    SocietyBean *societyBean;
    friendTypeNames = @[@"家人", @"朋友", @"同学", @"同事", @"俱乐部", @"社团", @"战友"];
    for(int i = 0; i < 7; i++){
        societyBean = [SocietyBean new];
        societyBean.societyImage = [NSString stringWithFormat:@"frendsType_%d", i + 1];
        societyBean.societyName = friendTypeNames[i];
        [friendsTypeData addObject:societyBean];
    }
    
    //tableView数据初始化
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

//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //设置即将跳转的页面类型
    [SystemParaManager setPostType:@"friends"];
    
    //页面跳转
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Society" bundle:[NSBundle mainBundle]];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"main"];
    [_baseController presentViewController:viewController animated:YES completion:nil];
}

- (CGSize)cellSize{
    CGFloat cellWidth, cellHeight;
    cellWidth = (SCREEN_WIDTH-5*cellSpace)/4;
    cellHeight = cellWidth + 30;
    return CGSizeMake(cellWidth, cellHeight);
}

@end
