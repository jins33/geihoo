//
//  SystemParaManager.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/28.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "SystemParaManager.h"

@implementation SystemParaManager

static NSString *postType = nil;

+ (NSString *)getPostType{
    return postType;
}

+ (void)setPostType:(NSString *)type{
    postType = type;
}

@end
