//
//  CircleImageButton.m
//  GeihooGroups
//
//  Created by hjs on 15/8/19.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import "CircleImageButton.h"

@implementation CircleImageButton{
}

-(void)awakeFromNib{
    [super awakeFromNib];
    if ([_imageType intValue] != NO_TYPE) {
        [self initCircleImageView];
    }
}

- (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initCircleImageView];
    }
    return self;
}

-(void)initCircleImageView{
    if (!_originalImageSize.width || !_originalImageSize.height) {
        _originalImageSize = self.frame.size;
    }
    if (_originalImage == nil) {
        _originalImage = self.imageView.image;
    }
    [self setDefaultParam];
    [self drawImage];
}

-(void)drawImage{
    
    self.layer.cornerRadius = _originalImageSize.width/2;
    self.layer.masksToBounds = YES;
    int imageTypeInt = [_imageType intValue];
    switch (imageTypeInt) {
        case CIRCLE_TYPE:
            [self drawCircle];
            break;
        case RING_TYPE:
            [self drawRing];
            break;
        default:
            break;
    }
}

-(void)drawCircle{
    if (_originalImage != nil) {
        [self setImage:_originalImage forState:UIControlStateNormal];
    }
}

-(void)drawRing{
    
    self.layer.borderWidth = 1;
    self.layer.borderColor = [[UIColor grayColor] CGColor];
    
    CGRect circleRect, innerRect, outerRect;
    //设置切割圆的大小位置
    circleRect.origin = CGPointMake(0, 0);
    circleRect.size = CGSizeMake(_originalImageSize.width-2*_pathWidth, _originalImageSize.height-2*_pathWidth);
    
    //设置外部圆的大小位置
    outerRect.origin = CGPointMake(_pathWidth/2, _pathWidth/2);
    outerRect.size = CGSizeMake(_originalImageSize.width-_pathWidth, _originalImageSize.height-_pathWidth);
    //设置内部圆的大小位置
    innerRect.origin = CGPointMake(_pathWidth, _pathWidth);
    innerRect.size = circleRect.size;
    
    //设置画布尺寸开始绘画
    UIGraphicsBeginImageContextWithOptions(circleRect.size,NO,0);
    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
    //添加圆形轨迹
    CGContextAddEllipseInRect(ctx1, circleRect);
    //切割出圆形图片
    CGContextClip(ctx1);
    [_originalImage drawInRect:circleRect];
    //将圆形图片保存至内存
    UIImage *circleImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //设置画布尺寸开始绘画
    UIGraphicsBeginImageContextWithOptions(self.frame.size,NO,0);
    //CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    [circleImage drawInRect:innerRect];
    //设置画笔颜色
    //CGContextSetStrokeColorWithColor(ctx2, [_pathColor CGColor]);
    //设置画笔宽度
    //CGContextSetLineWidth(ctx2, _pathWidth);
    //开始画外部圆
    //CGContextStrokeEllipseInRect(ctx2, outerRect);
    [self setImage:UIGraphicsGetImageFromCurrentImageContext() forState:UIControlStateNormal];
    UIGraphicsEndImageContext();
}

-(void)setDefaultParam{
    if (_imageType == nil || [_imageType intValue] == NO_TYPE) {
        _imageType = [NSNumber numberWithInt:RING_TYPE];
    }
    _pathWidth = 3;
    _pathColor = [UIColor clearColor];
}


@end
