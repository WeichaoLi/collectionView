//
//  CollectionViewCell.h
//  CollectionView
//
//  Created by 李伟超 on 14-11-19.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lableName;

@end
