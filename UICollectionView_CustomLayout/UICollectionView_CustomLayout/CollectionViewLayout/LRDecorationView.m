//
//  LRDecorationView.m
//  XUHUI
//
//  Created by 李伟超 on 14-12-5.
//  Copyright (c) 2014年 LR. All rights reserved.
//

#import "LRDecorationView.h"

@implementation LRDecorationView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [[UIColor whiteColor] set];
    UIRectFill(rect);
    
    if (!_imageview) {
        _imageview = [[UIImageView alloc] initWithFrame:rect];
        _imageview.backgroundColor = [UIColor whiteColor];
        if (rect.size.width < rect.size.height) {
            [_imageview setImage:[UIImage imageNamed:@"cm_hz"]];
        }else {
            [_imageview setImage:[UIImage imageNamed:@"cm_hv"]];
        }
        
        
        [self addSubview:_imageview];
    }
}



@end
