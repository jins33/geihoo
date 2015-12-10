//
//  SocietyPostBeans.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/7.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import "SocietyPostBeans.h"

@implementation SocietyPostBeans
+(SocietyPostBeans *)initUserImage:(NSString *)userImage andUserName:(NSString *)userName andPostPro:(NSString *)postPro andPostDescription:(NSString *)postDescription andPostImage:(NSString *)postImage{
    SocietyPostBeans *societyPostBeans = [[SocietyPostBeans alloc] init];
    societyPostBeans.userImage = userImage;
    societyPostBeans.userName = userName;
    societyPostBeans.postPro = postPro;
    societyPostBeans.postDescription = postDescription;
    societyPostBeans.postImage = postImage;
    return societyPostBeans;
}
@end
