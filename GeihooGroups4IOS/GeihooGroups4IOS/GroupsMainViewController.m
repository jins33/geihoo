//
//  GroupsMainViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/11.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import "GroupsMainViewController.h"
static NSString *kcellIdentifier = @"mainConllectionCell";
static NSString *kheaderIdentifier = @"headerIdentifier";
static NSString *kfooterIdentifier = @"footerIdentifier";
static NSString *resultsIdentifier = @"results";
@interface GroupsMainViewController ()

@end

@implementation GroupsMainViewController{
    NSArray *societyTypes, *societyNames, *collectionData, *collectionHeaderData, *societyData, *friendTypeNames;
    NSMutableArray *societyImages, *data, *friendsTypeData;
    CGFloat cellSpace, footHeight;
    NSNumber *imageType;
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

#pragma mark - sugue

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"groupsTabSegue"]) {
        GroupsTypeTabViewController *destController = (GroupsTypeTabViewController *)segue.destinationViewController;
        [destController setBaseController:self];
    }
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
    CGSize cellSize = [self cellSizeForSection:section];
    GroupsMainCollectionViewCell *cell = (GroupsMainCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"mainConllectionCell" forIndexPath:indexPath];
    CircleImageView *circleImageView = cell.societyIconImageView;
    SocietyBean *societyBean = collectionData[section][row];
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
    return [self cellSizeForSection:indexPath.section];
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

//返回尾footerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(320, footHeight);
}

//初始化headerView footerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]){
        GroupsCellHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:kheaderIdentifier   forIndexPath:indexPath];
        NSString *headerText = collectionHeaderData[indexPath.section];
        headerView.societyTypeLabel.text = headerText;
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
    [_headerView setHidden:YES];
    [_containerView setHidden:YES];
    cellSpace = GROUPS_ITEMS_SPACE;
    footHeight = 0;
    imageType = @2;
    [_scrollView setScrollEnabled:NO];
    [_friendCollectionView reloadData];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    collectionHeaderData = societyTypes;
    collectionData = societyData;
    [_headerView setHidden:NO];
    [_containerView setHidden:NO];
    cellSpace = FRIEND_ITEMS_SPACE;
    footHeight = 30;
    imageType = @1;
    [_scrollView setScrollEnabled:YES];
    [_friendCollectionView reloadData];
}

#pragma mark -数据视图初始化
-(void)initView{
    //通过Nib生成cell，然后注册 Nib的view需要继承 UICollectionViewCell
    [_friendCollectionView registerNib:[UINib nibWithNibName:@"GroupsMainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kcellIdentifier];
    
    //注册headerView Nib的view需要继承UICollectionReusableView
    [_friendCollectionView registerNib:[UINib nibWithNibName:@"GroupsCellHeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kheaderIdentifier];
    //注册footerView Nib的view需要继承UICollectionReusableView
    [_friendCollectionView registerNib:[UINib nibWithNibName:@"GroupsCellFooterCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kfooterIdentifier];
    
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
    //全局数据初始化
    cellSpace = FRIEND_ITEMS_SPACE;
    footHeight = 30;
    imageType = @1;
    
    data = [NSMutableArray array];
    societyImages  = [NSMutableArray array];
    friendsTypeData = [NSMutableArray array];
    SocietyBean *societyBean;
    societyTypes = @[@"朋友圈（7）"];
    collectionHeaderData = societyTypes;
    societyNames = @[@"大海诗社", @"萝莉控", @"小清新一族", @"赖床俱乐部", @"思考人生俱乐部", @"梦之族族", @"青春纪念册", @"动漫族族", @"We are a team", @"关爱小动物协会", @"疯狂一族", @"那些年"];
    for (int i = 0; i < 12; i++) {
        societyBean = [SocietyBean new];
        societyBean.societyImage = [NSString stringWithFormat:@"tx%d", i + 1];
        societyBean.societyName = societyNames[i];
        [data addObject:societyBean];
    }
    friendTypeNames = @[@"家人", @"朋友", @"同学", @"同事", @"俱乐部", @"社团", @"战友"];
    for(int i = 0; i < 7; i++){
        societyBean = [SocietyBean new];
        societyBean.societyImage = [NSString stringWithFormat:@"frendsType_%d", i + 1];
        societyBean.societyName = friendTypeNames[i];
        [friendsTypeData addObject:societyBean];
    }
    
    societyData = @[friendsTypeData, @[data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11]], @[data[0], data[1], data[2], data[3]], @[data[8], data[9], data[10], data[11]], @[data[0], data[1], data[2], data[3]]];
    collectionData = societyData;
}

//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //设置即将跳转的页面类型
    [SystemParaManager setPostType:@"friends"];
    
    //页面跳转
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Society" bundle:[NSBundle mainBundle]];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"main"];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (CGSize)cellSizeForSection: (NSInteger)section{
    CGFloat cellWidth, cellHeight;
    cellWidth = (SCREEN_WIDTH-5*cellSpace)/4;
    cellHeight = cellWidth + 50;
    return CGSizeMake(cellWidth, cellHeight);
}

@end
