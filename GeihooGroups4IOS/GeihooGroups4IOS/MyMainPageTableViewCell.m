//
//  MyMainPageTableViewCell.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/31.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "MyMainPageTableViewCell.h"
static NSString * const reuseIdentifier = @"photoCell";

@implementation MyMainPageTableViewCell{
    CGFloat cellSpace;
}

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -collectionView 代理方法
//定义UICollectionView section个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageNames.count;
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellSize];
}

//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, cellSpace, 0, cellSpace);//分别为上、左、下、右
}

//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return cellSpace;
}

//定义collectionView的最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return cellSpace;
}

//定义UICollectionViewCell内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    AlbumCollectionViewCell *cell = (AlbumCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.albumImageView.image = [UIImage imageNamed:_imageNames[row]];
    return cell;
}

- (void)initData{
    
}

- (void)initView{
    cellSpace = 5;
    _photoCollectionView.delegate = self;
    _photoCollectionView.dataSource = self;
    //计算photoCollectionView的高度
    int rowCount = (ceil(_imageNames.count/3.0));
    CGFloat collectionHeight = rowCount * [self cellSize].width + cellSpace * (rowCount - 1);
    _photoHeightCons.constant = collectionHeight < 0 ? 0 : collectionHeight;
    [self.contentView setNeedsUpdateConstraints];
}

- (CGSize)cellSize{
    [_photoCollectionView layoutIfNeeded];
    CGFloat collectionWidth = SCREEN_WIDTH - 138;
    CGFloat cellWidth, cellHeight;
    cellWidth = (collectionWidth-4*cellSpace)/3;
    cellHeight = cellWidth;
    return CGSizeMake(cellWidth, cellHeight);
}

@end
