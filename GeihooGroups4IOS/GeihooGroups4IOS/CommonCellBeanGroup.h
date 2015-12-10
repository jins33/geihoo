//
//  CommonCellBeanGroup.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/8.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonCellBeanGroup : NSObject

@property (nonatomic, strong) NSArray *commonCellBeans;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger online;

@property (nonatomic, assign, getter = isOpened) BOOL opened;

+ (instancetype)commonCellBeanGroupWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
