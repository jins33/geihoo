//
//  AddPicCollectionViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/26.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "AddPicCollectionViewController.h"
#define CELL_SPACE 8

@interface AddPicCollectionViewController ()

@end

@implementation AddPicCollectionViewController{
    NSArray *picImgs;
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
    return picImgs.count;
}

//定义UICollectionViewCell内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    long row = indexPath.row;
    PicCollectionViewCell *cell = (PicCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"picCell" forIndexPath:indexPath];
    [cell.picBtn setImage:[UIImage imageNamed:picImgs[row]] forState:UIControlStateNormal];
    if ([picImgs[row] isEqualToString:@"add_window"]) {
        [cell.xBtn setHidden:YES];
        [cell.picInfo setHidden:YES];
    }else{
        [cell.xBtn setHidden:NO];
        [cell.picInfo setHidden:NO];
    }
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
    return UIEdgeInsetsMake(CELL_SPACE, CELL_SPACE+10, 0, CELL_SPACE);//分别为上、左、下、右
}

//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return CELL_SPACE;
}

////选择了某个cell
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//}

#pragma mark -数据视图初始化
-(void)initView{
    
}

-(void)initData{
    picImgs = @[@"tx1", @"tx2", @"tx3", @"tx4", @"tx5", @"tx6", @"add_window"];
}

- (CGSize)cellSize{
    CGFloat cellWidth, cellHeight;
    cellWidth = (SCREEN_WIDTH-26-4*CELL_SPACE)/3;
    cellHeight = cellWidth+30;
    return CGSizeMake(cellWidth, cellHeight);
}


- (IBAction)postAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
