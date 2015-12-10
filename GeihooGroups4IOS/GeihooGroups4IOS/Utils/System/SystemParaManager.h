//
//  SystemParaManager.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/28.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemParaManager : NSObject
+ (NSString *)getPostType;
+ (void)setPostType:(NSString *)type;
@end
