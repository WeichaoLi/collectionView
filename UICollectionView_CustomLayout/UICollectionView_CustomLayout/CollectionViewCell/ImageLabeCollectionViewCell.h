//
//  ImageLabeCollectionViewCell.h
//  XUHUI
//
//  Created by 李伟超 on 14-12-1.
//  Copyright (c) 2014年 LR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageLabeCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myNameLable;

@property (nonatomic, strong) NSString *expandId;

@end
