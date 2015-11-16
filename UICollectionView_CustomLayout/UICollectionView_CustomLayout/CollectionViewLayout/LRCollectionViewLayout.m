//
//  LRCollectionViewLayout.m
//  XUHUI
//
//  Created by 李伟超 on 14-12-5.
//  Copyright (c) 2014年 LR. All rights reserved.
//

#import "LRCollectionViewLayout.h"
#import "LRDecorationView.h"

@implementation LRCollectionViewLayout

- (id)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (id)initwithLayoutArray:(NSArray *)array AndContentSize:(CGSize)size {
    LRCollectionViewLayout *layout = [self init];
    if (layout) {
        layout.LayoutArray = [NSMutableArray arrayWithArray:array];
        layout.ContentSize = size;
    }
    return layout;
}

- (void)prepareLayout {
    [super prepareLayout];
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.contentSize.width, 455);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    for (int y=0; y<self.collectionView.numberOfSections; y++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:3 inSection:y];
        [self.LayoutArray addObject:[self layoutAttributesForDecorationViewOfKind:@"SECTION_VIEW" atIndexPath:indexPath]];
    }
    
    return _LayoutArray;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAtt = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
    
    CGFloat OX = 5;
    CGFloat OY = 0;
    CGFloat H = 160;
    
    if (indexPath.section == 0) {
        OY = 50;
    }
    if (indexPath.section == 1) {
        OY = 215;
        H -= 15;
    }
    if (indexPath.section == 2) {
        OY = 365;
        H -= 75;
    }
    layoutAtt.frame = CGRectMake(OX, OY, self.collectionView.frame.size.width -2*OX, H);
    layoutAtt.zIndex = -1;
    
    return layoutAtt;
}

@end
