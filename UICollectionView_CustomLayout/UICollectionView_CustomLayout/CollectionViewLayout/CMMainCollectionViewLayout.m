//
//  CMMainCollectionViewLayout.m
//  ChongMing
//
//  Created by 李伟超 on 15/4/13.
//  Copyright (c) 2015年 LWC. All rights reserved.
//

#import "CMMainCollectionViewLayout.h"
#import "LRDecorationView.h"

@implementation CMMainCollectionViewLayout

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)initwithLayoutArray:(NSArray *)array AndContentSize:(CGSize)size {
    CMMainCollectionViewLayout *layout = [self init];
    if (layout) {
        layout.LayoutArray = [NSMutableArray arrayWithArray:array];
        layout.ContentSize = size;
    }
    return layout;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (void)prepareLayout {
    [super prepareLayout];
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height + 1);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {    
//    NSLog(@"%@",[super layoutAttributesForElementsInRect:rect]);
    for (int section = 0; section < self.collectionView.numberOfSections; section ++) {
//        for (int i=0; i < [self.collectionView numberOfItemsInSection:section]; i ++) {
//            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
//            [self.LayoutArray addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
//        }
        //分隔线
//        for (int i = 0; i < 4; i ++) {
//            [self.LayoutArray addObject:[self layoutAttributesForDecorationViewOfKind:@"DividingLine" atIndexPath:[NSIndexPath indexPathForItem:i inSection:section]]];
//        }
    }
    
    return _LayoutArray;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat OX = 0;
    CGFloat OY = (indexPath.row < 4)?0:80.5;
    if (indexPath.row < 4) {
        OX = indexPath.row * 80.5;
    }else {
        OX = (indexPath.row - 4 ) * 80.5;
    }
    
    attributes.frame = CGRectMake(OX, OY, 79.5, 79.5);
    attributes.zIndex = 0;
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *layoutAtt = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
    
    CGFloat OX = 80*(indexPath.row + 1) - 0.5;
    CGFloat OY = 0;
    CGFloat W = 1;
    CGFloat H = 160;
    
    
    if (indexPath.row == 3) {
        OX = 0;
        OY = 79.5;
        W = self.collectionView.frame.size.width;
        H = 1;
    }

    layoutAtt.frame = CGRectMake(OX, OY, W, H);
    layoutAtt.zIndex = 1;
    
    return layoutAtt;
}

@end
