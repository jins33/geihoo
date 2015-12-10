//
//  PhotoCollectionViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/11.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "PhotoCollectionViewController.h"

@interface PhotoCollectionViewController ()

@end

@implementation PhotoCollectionViewController

static NSString * const reuseIdentifier = @"photoCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    ABSWaterFlowLayout *waterFlowLayout = [[ABSWaterFlowLayout alloc]init];
    waterFlowLayout.delegate = self;
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView setCollectionViewLayout:waterFlowLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method
- (void)configureCollectionView {
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width , 70)];
    headView.backgroundColor = [UIColor greenColor];
    [self.collectionView addSubview:headView];
    
    UIView *refreshView = [[UIView alloc]initWithFrame:CGRectMake(0, -45, [UIScreen mainScreen].bounds.size.width, 45)];
    [refreshView setBackgroundColor:[UIColor blueColor]];
    [self.collectionView addSubview:refreshView];
}

#pragma mark - ABSWaterFlowLayoutDelegate
- (CGFloat)waterflowLayout:(ABSWaterFlowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0;
    if ([self.dataSource[indexPath.row] isKindOfClass:[Photo class]] ) {
        Photo *photo =  self.dataSource[indexPath.row];
        return [photo.h floatValue] / [photo.w floatValue] * width;
    }
    return height;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //        cell.backgroundColor = [UIColor redColor];
    if ([self.dataSource[indexPath.row] isKindOfClass:[Photo class]]) {
        Photo *photo = self.dataSource[indexPath.row];
        cell.photo = photo;
    }
    return cell;
}

- (NSArray *)dataSource
{
    if (!_dataSource ) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"plist"];
        NSArray<NSDictionary *> *array = [NSArray arrayWithContentsOfFile:plistPath];
        NSMutableArray *mArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            Photo *photo = [[Photo alloc]initWithDcit:dict];
            [mArray addObject:photo];
        }
        _dataSource = mArray;
        
    }
    return _dataSource;
}


@end
