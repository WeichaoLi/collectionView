//
//  LRCollectionViewLayout.h
//  XUHUI
//
//  Created by 李伟超 on 14-12-5.
//  Copyright (c) 2014年 LR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LRCollectionViewLayout : UICollectionViewLayout

@property (strong, nonatomic) NSMutableArray *LayoutArray;
@property (nonatomic) CGSize ContentSize;

- (id)initwithLayoutArray: (NSArray *)array AndContentSize:(CGSize)size;

@end
