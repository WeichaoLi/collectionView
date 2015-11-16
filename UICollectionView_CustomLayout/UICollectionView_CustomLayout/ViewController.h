//
//  ViewController.h
//  UICollectionView_CustomLayout
//
//  Created by 李伟超 on 15/4/17.
//  Copyright (c) 2015年 URL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end

