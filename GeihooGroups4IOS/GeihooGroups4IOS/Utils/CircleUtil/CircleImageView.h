//
//  CircleImageView.h
//  TestPrj
//
//  Created by hjs on 15/8/13.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CIRCLE_TYPE 1
#define RING_TYPE 2
#define NORMAL_TYPE 3
#define NO_TYPE 100

@interface CircleImageView : UIImageView

@property float pathWidth;
@property CGSize originalImageSize;

@property (nonatomic, strong) NSNumber *imageType;
@property (nonatomic, strong) UIColor *pathColor;
@property (nonatomic, strong) UIImage *originalImage;
-(void)initCircleImageView;
@end
