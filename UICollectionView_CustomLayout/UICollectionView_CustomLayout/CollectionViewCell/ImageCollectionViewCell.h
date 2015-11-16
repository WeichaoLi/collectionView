//
//  ImageCollectionViewCell.h
//  XUHUI
//
//  Created by 李伟超 on 14-12-2.
//  Copyright (c) 2014年 LR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *myImageView;
@property (strong, nonatomic) UILabel *myNameLable;

@property (nonatomic, strong) NSString *expandId;

@end
