//
//  ViewController.m
//  collectionview2
//
//  Created by 李伟超 on 14-12-3.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#define HOST @"http://img2.moko.cc/users/14/4228/1268402/post/"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation ViewController

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
    
    _array = [NSMutableArray arrayWithObjects:@"40/img2_cover_9718626.jpg", @"6a/img2_src_9717514.jpg", @"3d/img2_src_9717515.jpg", @"2d/img2_src_9717518.jpg", @"d5/img2_src_9717517.jpg", @"f0/img2_src_9717516.jpg", @"f6/img2_cover_9645660.jpg",@"29/img2_src_9672505.jpg", @"d8/img2_src_9672506.jpg", @"d8/img2_src_9642133.jpg", @"d5/img2_src_9642134.jpg", @"6a/img2_src_9642135.jpg", @"da/img2_src_9642136.jpg", @"f0/img2_src_9583716.jpg", @"b6/img2_src_9583717.jpg", @"ee/img2_src_9583718.jpg", @"48/img2_src_9583719.jpg", @"b0/img2_src_9583720.jpg", @"40/img2_cover_9718626.jpg", @"6a/img2_src_9717514.jpg", @"3d/img2_src_9717515.jpg", @"2d/img2_src_9717518.jpg", @"d5/img2_src_9717517.jpg", @"f0/img2_src_9717516.jpg", @"f6/img2_cover_9645660.jpg",@"29/img2_src_9672505.jpg", @"d8/img2_src_9672506.jpg", @"d8/img2_src_9642133.jpg", @"d5/img2_src_9642134.jpg", @"6a/img2_src_9642135.jpg", @"da/img2_src_9642136.jpg", @"f0/img2_src_9583716.jpg", @"b6/img2_src_9583717.jpg", @"ee/img2_src_9583718.jpg", @"48/img2_src_9583719.jpg", @"b0/img2_src_9583720.jpg", nil];
    
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(90, 90);
    [_myCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"customCell"];
    _myCollectionView.collectionViewLayout = layout;
//    [_myCollectionView registerNib:[UINib nibWithNibName:@"CollectonViewCell" bundle:nil] forCellWithReuseIdentifier:@"customCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_array count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"customCell";
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
//    NSURL *url = [[NSURL alloc] initWithString:[HOST stringByAppendingString:_array[indexPath.row]]];
//    [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default"]];
//    if (cell.imageView == nil) {
//        [cell setNeedsDisplayInRect:cell.frame];
//    }
    if (cell.imageView == nil) {
        cell.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
        cell.imageView.backgroundColor = [UIColor yellowColor];
        cell.imageView.contentMode = UIViewContentModeScaleToFill;
        cell.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [cell addSubview:cell.imageView];
    }
    cell.imageView.image = [UIImage imageNamed:@"1"];
    NSLog(@"%@",NSStringFromCGRect(cell.frame));
    NSLog(@"%@\n\n",NSStringFromCGRect(cell.imageView.frame));
    return cell;
}

#pragma mark - UICollectonViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}

@end
