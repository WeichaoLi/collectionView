//
//  LWCViewController.h
//  CollectionView
//
//  Created by 李伟超 on 14-11-19.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWCViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@end
