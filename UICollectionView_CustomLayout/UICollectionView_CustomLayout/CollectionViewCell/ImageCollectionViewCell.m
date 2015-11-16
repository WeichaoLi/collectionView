//
//  ImageCollectionViewCell.m
//  XUHUI
//
//  Created by 李伟超 on 14-12-2.
//  Copyright (c) 2014年 LR. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell

- (void)drawRect:(CGRect)rect {
    //
    [[UIColor clearColor] set];
    UIRectFill(rect);
    
    self.clipsToBounds = NO;
}

@end
