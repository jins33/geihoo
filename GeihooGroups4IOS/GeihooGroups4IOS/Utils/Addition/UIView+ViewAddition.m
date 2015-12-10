//
//  UIView+ViewAddition.m
//  TestPrj
//
//  Created by hjs on 15/9/17.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import "UIView+ViewAddition.h"

@implementation UIView (ViewAddition)
-(void)IBConstraintClear{
    UIView *superView = self.superview;
    [self removeFromSuperview];
    [superView addSubview:self];
}
@end
