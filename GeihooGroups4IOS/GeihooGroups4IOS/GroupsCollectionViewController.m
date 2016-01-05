//
//  GroupsCollectionViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/26.
//  Copyright © 2015年 hjs. All rights reserved.
//
#import "GroupsCollectionViewController.h"
static NSString * const kcellIdentifier = @"mainConllectionCell";
static NSString * const kheaderIdentifier = @"headerIdentifier";
static NSString * const kfooterIdentifier = @"footerIdentifier";
static NSString * const resultsIdentifier = @"results";

@interface GroupsCollectionViewController ()

@end

@implementation GroupsCollectionViewController{
    NSArray *societyTypes, *societyNames, *collectionData, *collectionHeaderData, *societyData;
    NSMutableArray *societyImages, *data;
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

#pragma mark -collectionView 代理方法
//定义UICollectionView item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [collectionData[section] count];
}

//定义UICollectionView section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return collectionHeaderData.count;
}

//定义UICollectionViewCell内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    long row = indexPath.row;
    long section = indexPath.section;
    CGSize cellSize = [self cellSize];
    GroupsMainCollectionViewCell *cell = (GroupsMainCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"mainConllectionCell" forIndexPath:indexPath];
    CircleImageView *circleImageView = cell.societyIconImageView;
    SocietyBean *societyBean = collectionData[section][row];
    circleImageView.originalImage = [UIImage imageNamed:societyBean.societyImage];
    circleImageView.originalImageSize = CGSizeMake(cellSize.width, cellSize.width);
    cell.societyNameTextView.text = societyBean.societyName;
    [circleImageView initCircleImageView];
    return cell;
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellSize];
}

//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, GROUPS_ITEMS_SPACE, 0, GROUPS_ITEMS_SPACE);//分别为上、左、下、右
}

//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return GROUPS_ITEMS_SPACE;
}

//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(320, 30);
}

//返回尾footerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    NSString *headerText = collectionHeaderData[section];
    if ([headerText hasPrefix:@"常用"] || [headerText hasPrefix:@"热门"]) {
        return CGSizeMake(320, 0);
    }
    return CGSizeMake(320, 30);
}

//初始化headerView footerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString *headerText = collectionHeaderData[indexPath.section];
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]){
        GroupsCellHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:kheaderIdentifier   forIndexPath:indexPath];
        headerView.societyTypeLabel.text = headerText;
        if ([headerText hasPrefix:@"常用族族"]) {
            headerView.editCommonGroupsBtn.hidden = NO;
            //通过ReactiveCocoa注册editCommonGroupsBtn点击事件
            headerView.editCommonGroupsBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
                UITableViewController *tableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"editTableView"];
                [_baseController.navigationController pushViewController:tableViewController animated:YES];
                return [RACSignal empty];
            }];
        }else{
            headerView.editCommonGroupsBtn.hidden = YES;
        }
        return headerView;
    }else{
        GroupsCellFooterCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:kfooterIdentifier   forIndexPath:indexPath];
        return footerView;
    }
}

#pragma mark -UISearchBar 代理方法
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    collectionHeaderData = @[@"热门族族☆"];
    collectionData = @[@[data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]]];
    [self.collectionView reloadData];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    collectionHeaderData = societyTypes;
    collectionData = societyData;
    [self.collectionView reloadData];
}


#pragma mark -数据视图初始化
-(void)initView{
    
    self.navigationController.navigationBarHidden = YES;
    
    //通过Nib生成cell，然后注册 Nib的view需要继承 UICollectionViewCell
    [self.collectionView registerNib:[UINib nibWithNibName:@"GroupsMainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kcellIdentifier];
    //注册headerView Nib的view需要继承UICollectionReusableView
    [self.collectionView registerNib:[UINib nibWithNibName:@"GroupsCellHeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kheaderIdentifier];
    //注册footerView Nib的view需要继承UICollectionReusableView
    [self.collectionView registerNib:[UINib nibWithNibName:@"GroupsCellFooterCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kfooterIdentifier];
    
    //初始化ResultsTableViewController, UISearchController, UISearchBar
    ResultsTableViewController *resultsTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:resultsIdentifier];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:resultsTableViewController];
    _searchController.searchResultsUpdater = resultsTableViewController;
    [_searchController.searchBar sizeToFit];
    _searchController.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = NO;
    _searchController.searchBar.placeholder = @"搜索族族";
    _searchController.searchBar.delegate = self;
    [_searchView addSubview:_searchController.searchBar];
}

-(void)initData{
    data = [NSMutableArray array];
    societyImages  = [NSMutableArray array];
    SocietyBean *societyBean;
    societyTypes = @[@"常用族族（8）", @"公开族族（7）", @"私密族族（7）", @"封闭族族（5）"];
    collectionHeaderData = societyTypes;
    societyNames = @[@"大海诗社", @"萝莉控", @"小清新一族", @"赖床俱乐部", @"思考人生俱乐部", @"梦之族族", @"青春纪念册", @"动漫族族", @"We are a team", @"关爱小动物协会", @"疯狂一族", @"那些年"];
    for (int i = 0; i < 12; i++) {
        societyBean = [SocietyBean new];
        societyBean.societyImage = [NSString stringWithFormat:@"tx%d", i + 1];
        societyBean.societyName = societyNames[i];
        [data addObject:societyBean];
    }
    
    societyData = @[@[data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]], @[data[0], data[1], data[2], data[3]], @[data[8], data[9], data[10], data[11]], @[data[0], data[1], data[2], data[3]]];
    collectionData = societyData;
}

//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //设置即将跳转的页面类型
    [SystemParaManager setPostType:@"groups"];
    
    //页面跳转
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Society" bundle:[NSBundle mainBundle]];
    UITabBarController *tabBarController = [storyboard instantiateInitialViewController];
    [_baseController presentViewController:tabBarController animated:YES completion:nil];
}

- (CGSize)cellSize{
    int cellSpace = GROUPS_ITEMS_SPACE;
    CGFloat cellWidth, cellHeight;
    cellWidth = (SCREEN_WIDTH-5*cellSpace)/4;
    cellHeight = cellWidth + 50;
    return CGSizeMake(cellWidth, cellHeight);
}

@end
