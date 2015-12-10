//
//  UIImage+ImageAddition.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/30.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "UIImage+ImageAddition.h"

@implementation UIImage (ImageAddition)

-(UIImage *)circleImageWithSize:(CGSize)size{
    CGRect circleRect;
    //设置切割圆的大小位置
    circleRect.origin = CGPointMake(0, 0);
    circleRect.size = size;
    //设置画布尺寸开始绘画
    UIGraphicsBeginImageContextWithOptions(circleRect.size,NO,0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //添加圆形轨迹
    CGContextAddEllipseInRect(ctx, circleRect);
    //切割出圆形图片
    CGContextClip(ctx);
    [self drawInRect:circleRect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //返回图片
    return image;
}

- (UIImage *)ringImageWithSize:(CGSize)size{
    CGRect circleRect, innerRect, outerRect;
    float pathWidth = 0.3, spaceWidth = 2, totalWidth = pathWidth + spaceWidth;
    //CGRect outerRect;
    //设置切割圆的大小位置
    circleRect.origin = CGPointMake(0, 0);
    circleRect.size = CGSizeMake(size.width-2*totalWidth, size.height-2*totalWidth);
    
    //设置外部圆的大小位置
    outerRect.origin = CGPointMake(pathWidth, pathWidth);
    outerRect.size = CGSizeMake(size.width-2*pathWidth, size.height-2*pathWidth);
    //设置内部圆的大小位置
    innerRect.origin = CGPointMake(totalWidth, totalWidth);
    innerRect.size = circleRect.size;
    
    //设置画布尺寸开始绘画
    UIGraphicsBeginImageContextWithOptions(circleRect.size,NO,0);
    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
    //添加圆形轨迹
    CGContextAddEllipseInRect(ctx1, circleRect);
    //切割出圆形图片
    CGContextClip(ctx1);
    [self drawInRect:circleRect];
    //将圆形图片保存至内存
    UIImage *circleImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //设置画布尺寸开始绘画
    UIGraphicsBeginImageContextWithOptions(size,NO,0);
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    [circleImage drawInRect:innerRect];
    //设置画笔颜色
    CGContextSetStrokeColorWithColor(ctx2, [[UIColor grayColor] CGColor]);
    //设置画笔宽度
    CGContextSetLineWidth(ctx2, pathWidth);
    //开始画外部圆
    CGContextStrokeEllipseInRect(ctx2, outerRect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
