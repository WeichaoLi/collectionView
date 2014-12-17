//
//  CollectionViewCell.m
//  collectionview2
//
//  Created by 李伟超 on 14-12-3.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [[UIColor redColor] set];
    UIRectFill(rect);
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:rect];
        _imageView.backgroundColor = [UIColor yellowColor];
        _imageView.contentMode = UIViewContentModeScaleToFill;
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_imageView];
    }
    
}

@end
