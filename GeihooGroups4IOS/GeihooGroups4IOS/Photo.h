//
//  Photo.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/11.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSString *h;

@property (nonatomic, strong) NSString *w;

@property (nonatomic, strong) NSString *imageUrl;

- (instancetype)initWithDcit:(NSDictionary *)dict;

@end
