//
//  TypeCollectionViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/22.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "TypeCollectionViewController.h"
#define CELL_SPACE 30
static NSString * const kcellIdentifier = @"mainConllectionCell";
static NSString * const setingIdentifier = @"groupSeting";

@interface TypeCollectionViewController ()

@end

@implementation TypeCollectionViewController{
    NSArray *typeNames, *typeImages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -collectionView 代理方法
//定义UICollectionView item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return typeNames.count;
}

//定义UICollectionViewCell内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    long row = indexPath.row;
    CGSize cellSize = [self cellSize];
    GroupsMainCollectionViewCell *cell = (GroupsMainCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"mainConllectionCell" forIndexPath:indexPath];
    CircleImageView *circleImageView = cell.societyIconImageView;
    if ([typeNames[row] isEqualToString:@""]) {
        [circleImageView setHidden:YES];
    }else{
        [circleImageView setHidden:NO];
    }
    circleImageView.originalImage = [UIImage imageNamed:typeImages[row]];
    circleImageView.originalImageSize = CGSizeMake(cellSize.width, cellSize.width);
    cell.societyNameTextView.text = typeNames[row];
    circleImageView.imageType = [NSNumber numberWithInt:CIRCLE_TYPE];
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
    return UIEdgeInsetsMake(CELL_SPACE, CELL_SPACE, 0, CELL_SPACE);//分别为上、左、下、右
}

//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return CELL_SPACE;
}

//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GroupSetingViewController *groupSetingViewController = [self.storyboard instantiateViewControllerWithIdentifier:setingIdentifier];
    [self.navigationController pushViewController:groupSetingViewController animated:YES];
}

#pragma mark -数据视图初始化
-(void)initView{
    //通过Nib生成cell，然后注册 Nib的view需要继承 UICollectionViewCell
    [self.collectionView registerNib:[UINib nibWithNibName:@"GroupsMainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kcellIdentifier];
}

-(void)initData{
    typeNames = @[@"家人", @"挚友", @"俱乐部", @"活动策划", @"父母", @"团队成员", @"", @"自定义"];
    typeImages = @[@"type0", @"type1", @"type0", @"type1", @"type0", @"type1", @"", @"type_add"];
}

- (CGSize)cellSize{
    int cellSpace = CELL_SPACE;
    CGFloat cellWidth, cellHeight;
    cellWidth = (SCREEN_WIDTH-4*cellSpace)/3;
    cellHeight = cellWidth + 40;
    return CGSizeMake(cellWidth, cellHeight);
}

@end
