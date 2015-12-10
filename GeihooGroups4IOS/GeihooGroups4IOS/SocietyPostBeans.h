//
//  SocietyPostBeans.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/7.
//  Copyright (c) 2015年 hjs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SocietyPostBeans : NSObject

@property (nonatomic, strong) NSString *userImage;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *postPro;
@property (nonatomic, strong) NSString *postDescription;
@property (nonatomic, strong) NSString *postImage;

+(SocietyPostBeans *)initUserImage:(NSString *)userImage andUserName:(NSString *)userName andPostPro:(NSString *)postPro andPostDescription:(NSString *)postDescription andPostImage:(NSString *)postImage;

@end
