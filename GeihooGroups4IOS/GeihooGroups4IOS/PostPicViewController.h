//
//  PostPicViewController.h
//  GeihooGroups4IOS
//
//  Created by hjs on 15/11/25.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PicCollectionViewCell.h"
#import "SystemPrefixHeader.pch"

@interface PostPicViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
- (IBAction)postAction:(id)sender;

@end
