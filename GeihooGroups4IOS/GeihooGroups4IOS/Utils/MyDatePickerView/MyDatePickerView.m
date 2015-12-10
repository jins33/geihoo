//
//  CircleImageButton.m
//  GeihooGroups
//
//  Created by hjs on 15/12/3.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import "MyDatePickerView.h"

@implementation MyDatePickerView{
    NSDateFormatter *dateFormat;
}

- (instancetype)init{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"MyDatePickerView" owner:nil options:nil]firstObject];
        self.frame = [UIScreen mainScreen].bounds;
        
        dateFormat = [[NSDateFormatter alloc] init];
        //cccc 星期全名 MMMM月全名
        [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [self customView];
    }
    return self;
}

- (void)customView{
    self.contentViewHegithCons.constant = 0;
    [self layoutIfNeeded];
}

#pragma mark - action

//选择完成
- (IBAction)finishBtnPress:(UIButton *)sender {
    NSString *dateStr = [dateFormat stringFromDate:_datePicker.date];
    if (self.block) {
        self.block(self,sender,dateStr);
    }
    [self hide];
}

//隐藏
- (IBAction)dissmissBtnPress:(UIButton *)sender {
    [self hide];
}

#pragma  mark - function

- (void)show{
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    UIView *topView = [win.subviews firstObject];
    [topView addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.contentViewHegithCons.constant = 250;
        [self layoutIfNeeded];
    }];
}

- (void)hide{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        self.contentViewHegithCons.constant = 0;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end