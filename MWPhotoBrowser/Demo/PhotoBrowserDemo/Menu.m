//
//  Menu.m
//  MWPhotoBrowser
//
//  Created by Michael Waterfall on 21/10/2010.
//  Copyright 2010 d3i. All rights reserved.
//

#import "Menu.h"
#import "SDImageCache.h"
#import "MWCommon.h"

@implementation Menu

#pragma mark -
#pragma mark Initialization

- (id)initWithStyle:(UITableViewStyle)style {
    if ((self = [super initWithStyle:style])) {
		self.title = @"MWPhotoBrowser";
        
        // Clear cache for testing
        [[SDImageCache sharedImageCache] clearDisk];
        [[SDImageCache sharedImageCache] clearMemory];
        
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Push", @"Modal", nil]];
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
            _segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
        }
#endif
        _segmentedControl.selectedSegmentIndex = 0;
        [_segmentedControl addTarget:self action:@selector(segmentChange) forControlEvents:UIControlEventValueChanged];
        
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:_segmentedControl];
        self.navigationItem.rightBarButtonItem = item;
//        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];

        
    }
    return self;
}

- (void)segmentChange {
    [self.tableView reloadData];
}


#pragma mark -
#pragma mark View

- (void)viewDidLoad {
    [super viewDidLoad];
    // Test toolbar hiding
//    [self setToolbarItems: @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil]]];
//    [[self navigationController] setToolbarHidden:NO animated:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
//    self.navigationController.navigationBar.translucent = NO;
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationNone;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 4;

    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	// Create
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.accessoryType = _segmentedControl.selectedSegmentIndex == 0 ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;

    // Configure
	switch (indexPath.row) {
		case 0: {
            cell.textLabel.text = @"Multiple photos";
            cell.detailTextLabel.text = @"with captions";
            break;
        }
		case 1: {
            cell.textLabel.text = @"Multiple photo grid";
            cell.detailTextLabel.text = @"showing grid first, nav arrows enabled";
            break;
        }
		case 2: {
            cell.textLabel.text = @"Photo selections";
            cell.detailTextLabel.text = @"selection enabled";
            break;
        }
		case 3: {
            cell.textLabel.text = @"Photo selection grid";
            cell.detailTextLabel.text = @"selection enabled, start at grid";
            break;
        }
        default: break;
	}
    return cell;
	
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// Browser
	NSMutableArray *photos = [[NSMutableArray alloc] init];
	NSMutableArray *thumbs = [[NSMutableArray alloc] init];
    MWPhoto *photo;
    BOOL displayActionButton = YES;
    BOOL displaySelectionButtons = NO;
    BOOL displayNavArrows = NO;
    BOOL enableGrid = YES;
    BOOL startOnGrid = NO;
	switch (indexPath.row) {
		case 0: {
            // Photos
            photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo5" ofType:@"jpg"]]];
            photo.caption = @"Fireworks";
			[photos addObject:photo];
            photo = [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"photo2" ofType:@"jpg"]]];
            photo.caption = @"The London Eye is a giant Ferris wheel situated on the banks of the River Thames, in London, England.";
			[photos addObject:photo];
            photo = [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"photo3" ofType:@"jpg"]]];
            photo.caption = @"York Floods";
			[photos addObject:photo];
            photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo4" ofType:@"jpg"]]];
            photo.caption = @"Campervan";
			[photos addObject:photo];
            // Options
            enableGrid = NO;
			break;
        }
		case 1: {
            // Photos
            photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo5" ofType:@"jpg"]]];
            photo.caption = @"White Tower";
			[photos addObject:photo];
            photo = [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"photo2" ofType:@"jpg"]]];
            photo.caption = @"The London Eye is a giant Ferris wheel situated on the banks of the River Thames, in London, England.";
			[photos addObject:photo];
            photo = [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"photo3" ofType:@"jpg"]]];
            photo.caption = @"York Floods";
			[photos addObject:photo];
            photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo4" ofType:@"jpg"]]];
            photo.caption = @"Campervan";
			[photos addObject:photo];
            // Thumbs
            photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo5t" ofType:@"jpg"]]];
			[thumbs addObject:photo];
            photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo2t" ofType:@"jpg"]]];
			[thumbs addObject:photo];
            photo = [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"photo3t" ofType:@"jpg"]]];
			[thumbs addObject:photo];
            photo = [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"photo4t" ofType:@"jpg"]]];
			[thumbs addObject:photo];
            // Options
            startOnGrid = YES;
            displayNavArrows = YES;
			break;
        }
		case 2:
		case 3: {
            // Photos
            photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo4" ofType:@"jpg"]]];
			[photos addObject:photo];
            photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo1" ofType:@"jpg"]]];
			[photos addObject:photo];
            photo = [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"photo2" ofType:@"jpg"]]];
			[photos addObject:photo];
            photo = [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"photo3" ofType:@"jpg"]]];
			[photos addObject:photo];
            // Thumbs
            photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo4t" ofType:@"jpg"]]];
			[thumbs addObject:photo];
            photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo1t" ofType:@"jpg"]]];
			[thumbs addObject:photo];
            photo = [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"photo2t" ofType:@"jpg"]]];
			[thumbs addObject:photo];
            photo = [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"photo3t" ofType:@"jpg"]]];
			[thumbs addObject:photo];
            // Options
            displayActionButton = NO;
            displaySelectionButtons = YES;
            startOnGrid = indexPath.row == 3;
            enableGrid = NO;
			break;
        }
		default: break;
	}
    self.photos = photos;
    self.thumbs = thumbs;
	
	// Create browser
	MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    browser.displayActionButton = displayActionButton;
    browser.displayNavArrows = displayNavArrows;
    browser.displaySelectionButtons = displaySelectionButtons;
    browser.alwaysShowControls = displaySelectionButtons;
    browser.zoomPhotosToFill = YES;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    browser.wantsFullScreenLayout = YES;
#endif
    browser.enableGrid = enableGrid;
    browser.startOnGrid = startOnGrid;
    browser.enableSwipeToDismiss = YES;
    [browser setCurrentPhotoIndex:0];
    
    // Reset selections
    if (displaySelectionButtons) {
        _selections = [NSMutableArray new];
        for (int i = 0; i < photos.count; i++) {
            [_selections addObject:[NSNumber numberWithBool:NO]];
        }
    }
    
    // Show
    if (_segmentedControl.selectedSegmentIndex == 0) {
        // Push
        [self.navigationController pushViewController:browser animated:YES];
    } else {
        // Modal
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:browser];
        nc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nc animated:YES completion:nil];
    }
    
    // Release
	
	// Deselect
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Test reloading of data after delay
    double delayInSeconds = 3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    
//        // Test removing an object
//        [_photos removeLastObject];
//        [browser reloadData];
//    
//        // Test all new
//        [_photos removeAllObjects];
//        [_photos addObject:[MWPhoto photoWithFilePath:[[NSBundle mainBundle] pathForResource:@"photo3" ofType:@"jpg"]]];
//        [browser reloadData];
//    
//        // Test changing photo index
//        [browser setCurrentPhotoIndex:9];
    
//        // Test updating selections
//        _selections = [NSMutableArray new];
//        for (int i = 0; i < [self numberOfPhotosInPhotoBrowser:browser]; i++) {
//            [_selections addObject:[NSNumber numberWithBool:YES]];
//        }
//        [browser reloadData];
        
    });

}

#pragma mark - MWPhotoBrowserDelegate

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return _photos.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < _photos.count)
        return [_photos objectAtIndex:index];
    return nil;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < _thumbs.count)
        return [_thumbs objectAtIndex:index];
    return nil;
}

- (MWCaptionView *)photoBrowser:(MWPhotoBrowser *)photoBrowser captionViewForPhotoAtIndex:(NSUInteger)index {
    MWPhoto *photo = [self.photos objectAtIndex:index];
    MWCaptionView *captionView = [[MWCaptionView alloc] initWithPhoto:photo];
    return captionView;
}

//- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser actionButtonPressedForPhotoAtIndex:(NSUInteger)index {
//    NSLog(@"ACTION!");
//}

- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}

- (BOOL)photoBrowser:(MWPhotoBrowser *)photoBrowser isPhotoSelectedAtIndex:(NSUInteger)index {
    return [[_selections objectAtIndex:index] boolValue];
}

//- (NSString *)photoBrowser:(MWPhotoBrowser *)photoBrowser titleForPhotoAtIndex:(NSUInteger)index {
//    return [NSString stringWithFormat:@"Photo %lu", (unsigned long)index+1];
//}

- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index selectedChanged:(BOOL)selected {
    [_selections replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:selected]];
    NSLog(@"Photo at index %lu selected %@", (unsigned long)index, selected ? @"YES" : @"NO");
}

- (void)photoBrowserDidFinishModalPresentation:(MWPhotoBrowser *)photoBrowser {
    // If we subscribe to this method we must dismiss the view controller ourselves
    NSLog(@"Did finish modal presentation");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

