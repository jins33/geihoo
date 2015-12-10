//
//  NSDictionary+StringAttributeForKey.m
//  UICollection 流水布局
//
//  Created by 我的小丫小苹果 on 15/10/5.
//  Copyright © 2015年 Abson. All rights reserved.
//

#import "NSDictionary+StringAttributeForKey.h"

@implementation NSDictionary (StringAttributeForKey)


- (NSString *)stringAttributeForKey:(NSString *)key {
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSObject class]]) {
        
    }else {
        return @"";
    }
    
    if ([obj isKindOfClass: [NSString class]]) {
        return obj;
    }
    
    if ([obj isKindOfClass:[NSNumber class]]) {
        return [obj stringValue];
    }
    
    return @"None";
}


@end
