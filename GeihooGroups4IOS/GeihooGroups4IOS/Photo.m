//
//  Photo.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/11.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "Photo.h"
#import "NSDictionary+StringAttributeForKey.h"

@implementation Photo

- (instancetype)initWithDcit:(NSDictionary *)dict {
    if (self = [super init]) {
        self.w = [dict stringAttributeForKey:@"w"];
        self.h = [dict stringAttributeForKey:@"h"];
        self.imageUrl = [dict stringAttributeForKey:@"img"];
    }
    return self;
}

@end
