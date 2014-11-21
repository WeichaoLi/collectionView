//
//  LWCViewController.m
//  collection_View
//
//  Created by 李伟超 on 14-11-21.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "LWCViewController.h"
#import "CollectonViewCell.h"

@interface LWCViewController ()

@end

@implementation LWCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    [_myCollectionView registerNib:[UINib nibWithNibName:@"CollectonViewCell" bundle:nil] forCellWithReuseIdentifier:@"customCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 44;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"customCell";
    CollectonViewCell *cell = (CollectonViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.lableName.text = @"111";
    
    return cell;
}

#pragma mark - UICollectonViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"----");
}

@end
