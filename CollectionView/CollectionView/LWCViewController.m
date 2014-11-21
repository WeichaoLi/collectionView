//
//  LWCViewController.m
//  CollectionView
//
//  Created by 李伟超 on 14-11-19.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "LWCViewController.h"
#import "NextViewController.h"
#import "CollectionViewCell.h"

@interface LWCViewController ()

@end

@implementation LWCViewController {
    UIRefreshControl *refreshContol;
    NextViewController *nextVC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    refreshContol = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, -64, _myCollectionView.frame.size.width, 64)];
    refreshContol.tintColor = [UIColor redColor];
    refreshContol.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    refreshContol.backgroundColor = [UIColor yellowColor];
    [refreshContol addTarget:self action:@selector(didRefreshEvent:) forControlEvents:UIControlEventValueChanged];
    [_myCollectionView insertSubview:refreshContol atIndex:0];
}

- (void)didRefreshEvent:(id)sender {
    NSLog(@"111");
    [self performSelector:@selector(endRefresh) withObject:nil afterDelay:2.f];
}

- (void)endRefresh {
    [refreshContol endRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"myCollectionCell";
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.lableName.text = @"MM";
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (nextVC == nil) {
        nextVC = [[NextViewController alloc] init];
    }
//    [self.navigationController pushViewController:nextVC animated:YES];
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"CollectionViewSelected" source:self destination:nextVC performHandler:^(){}];
    NSLog(@"%@",segue.destinationViewController);
//    [segue perform];
}

@end
