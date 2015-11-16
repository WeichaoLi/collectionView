//
//  CMMainCollectionViewLayout.h
//  ChongMing
//
//  Created by 李伟超 on 15/4/13.
//  Copyright (c) 2015年 LWC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMMainCollectionViewLayout : UICollectionViewLayout

@property (strong, nonatomic) NSMutableArray *LayoutArray;
@property (nonatomic) CGSize ContentSize;

- (id)initwithLayoutArray: (NSArray *)array AndContentSize:(CGSize)size;

@end
