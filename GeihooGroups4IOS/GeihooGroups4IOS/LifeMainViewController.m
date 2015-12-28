//
//  LifeMainViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/28.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "LifeMainViewController.h"

static NSString* const kcellIdentifier = @"mainConllectionCell";

@interface LifeMainViewController ()

@end

@implementation LifeMainViewController{
    NSArray *cellNames, *cellImages;
    CGFloat cellSpace;
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

#pragma mark -collectionView 代理方法
//定义UICollectionView item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return cellNames.count;
}

//定义UICollectionViewCell内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    long row = indexPath.row;
    CGSize cellSize = [self cellSize];
    GroupsMainCollectionViewCell *cell = (GroupsMainCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kcellIdentifier forIndexPath:indexPath];
    CircleImageView *circleImageView = cell.societyIconImageView;
    circleImageView.image = [UIImage imageNamed:cellImages[row]];
    circleImageView.imageType = imageType;
    circleImageView.originalImageSize = CGSizeMake(cellSize.width, cellSize.width);
    cell.societyNameTextView.text = cellNames[row];
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
    return UIEdgeInsetsMake(cellSpace, cellSpace, 0, cellSpace);//分别为上、左、下、右
}

//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return cellSpace;
}


#pragma mark -数据视图初始化
-(void)initView{
    //通过Nib生成cell，然后注册 Nib的view需要继承 UICollectionViewCell
    [_collectionView registerNib:[UINib nibWithNibName:@"GroupsMainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kcellIdentifier];
}

-(void)initData{
    cellSpace = 50;
    imageType = @3;
    cellNames = @[@"族记", @"记账", @"音乐",@"视频", @"收藏", @"书架", @""];
    cellImages = @[@"my_notepad", @"my_jizhangben", @"my_music", @"my_shipin", @"my_shoucang", @"my_shujiaxuanzhong", @"my_tianjia"];
}

- (CGSize)cellSize{
    CGFloat cellWidth, cellHeight;
    cellWidth = (_collectionView.frame.size.width-4*cellSpace)/3;
    cellHeight = cellWidth + 50;
    return CGSizeMake(cellWidth, cellHeight);
}

@end
