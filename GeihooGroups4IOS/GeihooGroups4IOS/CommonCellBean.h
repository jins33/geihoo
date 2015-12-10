//
//  CommonCellBean.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/8.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonCellBean : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign, getter = isVip) BOOL vip;

+ (instancetype)commonCellBeanWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
