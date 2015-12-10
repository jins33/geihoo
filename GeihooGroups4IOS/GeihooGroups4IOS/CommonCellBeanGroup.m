//
//  CommonCellBeanGroup.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/12/8.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "CommonCellBeanGroup.h"
#import "CommonCellBean.h"

@implementation CommonCellBeanGroup

+ (instancetype)commonCellBeanGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in _commonCellBeans) {
            CommonCellBean *commonCellBean = [CommonCellBean commonCellBeanWithDict:dict];
            [tempArray addObject:commonCellBean];
        }
        _commonCellBeans = tempArray;
    }
    return self;
}

@end
