//
//  LWCViewController.h
//  collection_View
//
//  Created by 李伟超 on 14-11-21.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWCViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@end
