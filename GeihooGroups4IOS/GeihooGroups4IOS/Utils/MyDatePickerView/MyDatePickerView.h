//
//  CircleImageButton.h
//  GeihooGroups
//
//  Created by hjs on 15/12/3.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyDatePickerView;
typedef void (^MyDatePickerViewBlock)(MyDatePickerView *view,UIButton *btn,NSString *dateStr);
@interface MyDatePickerView : UIView

@property (copy, nonatomic)MyDatePickerViewBlock block;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHegithCons;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)dissmissBtnPress:(UIButton *)sender;
- (IBAction)finishBtnPress:(UIButton *)sender;

- (void)show;
@end