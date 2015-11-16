//
//  ViewController.m
//  UICollectionView_CustomLayout
//
//  Created by 李伟超 on 15/4/17.
//  Copyright (c) 2015年 URL. All rights reserved.
//

#import "ViewController.h"
#import "MCollectionViewCell.h"
#import "CMMainCollectionViewLayout.h"
#import "LRDecorationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#ifdef __IPHONE_7_0
    self.navigationController.navigationBar.translucent = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
#endif
    
    [_myCollectionView registerClass:[MCollectionViewCell class] forCellWithReuseIdentifier:@"imageCell"];
    
    [_myCollectionView registerClass:[MCollectionViewCell class] forCellWithReuseIdentifier:@"imageCell"];
    _myCollectionView.backgroundColor = [UIColor clearColor];
    UIImageView *bg_imageview = [[UIImageView alloc] initWithFrame:_myCollectionView.bounds];
    [bg_imageview setImage:[UIImage imageNamed:@"cm_col"]];
    [_myCollectionView setBackgroundView:bg_imageview];
    
    CMMainCollectionViewLayout *layout = [[CMMainCollectionViewLayout alloc] initwithLayoutArray:[_myCollectionView.collectionViewLayout layoutAttributesForElementsInRect:_myCollectionView.bounds] AndContentSize:_myCollectionView.bounds.size];
    [layout invalidateLayout];
    [layout registerClass:[LRDecorationView class] forDecorationViewOfKind:@"DividingLine"];
    [_myCollectionView setCollectionViewLayout:layout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 80;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"imageCell";
    NSLog(@"%@",indexPath.description);
    MCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
    if (cell.myImageView == nil) {
        cell.myImageView = [[UIImageView alloc] initWithFrame:CGRectMake((cell.bounds.size.width - 45)/2, 10, 45, 45)];
        cell.backgroundColor = [UIColor clearColor];
        [cell.myImageView sizeThatFits:cell.myImageView.bounds.size];
        [cell addSubview:cell.myImageView];
    }
    if (cell.myNameLable == nil) {
        cell.myNameLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 55, cell.frame.size.width, 20)];
        cell.myNameLable.backgroundColor = [UIColor clearColor];
        cell.myNameLable.textColor = [UIColor whiteColor];
        cell.myNameLable.font = [UIFont systemFontOfSize:15];
        cell.myNameLable.textAlignment = NSTextAlignmentCenter;
        
        [cell addSubview:cell.myNameLable];
    }
    [cell.myImageView setImage:[UIImage imageNamed:@"cm_movie"]];
    cell.myNameLable.text = @"视频";
    return cell;
}

@end
