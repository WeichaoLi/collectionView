//
//  MCollectionViewCell.m
//  UICollectionView_CustomLayout
//
//  Created by 李伟超 on 15/4/17.
//  Copyright (c) 2015年 URL. All rights reserved.
//

#import "MCollectionViewCell.h"

@implementation MCollectionViewCell

- (void)drawRect:(CGRect)rect {
    //
    [[UIColor clearColor] set];
    UIRectFill(rect);
    
    self.clipsToBounds = NO;
}

@end
