//
//  GroupsCellHeaderCollectionReusableView.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/9/18.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "GroupsCellHeaderCollectionReusableView.h"

@implementation GroupsCellHeaderCollectionReusableView

- (instancetype)init{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"GroupsCellHeaderCollectionReusableView" owner:nil options:nil]firstObject];
        self.frame = CGRectMake(0, 0, 320, 30);
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
