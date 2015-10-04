//
//  ViewController.m
//  MCCardPickerCollectionViewController
//
//  Created by Michael Chen on 2015/3/4.
//  Copyright (c) 2015年 Michael Chen. All rights reserved.
//

#import "ViewControllers.h"
#import "MCCardPickerCollectionViewController.h"
#import "MCSampleCardCollectionViewCell.h"

static NSString *const kCellIdentifier = @"MCSampleCell";

@interface ViewControllers ()<MCCardPickerCollectionViewControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) MCCardPickerCollectionViewController *cardViewController;
@end

@implementation ViewControllers

- (void)viewDidLoad {
	[super viewDidLoad];

	self.cardViewController = [[MCCardPickerCollectionViewController alloc] init];
	self.cardViewController.delegate = self;
	[self.cardViewController.collectionView registerClass:[MCSampleCardCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    [self showPicker:nil];
}

- (IBAction)showPicker:(id)sender {
	[self.cardViewController presentInViewController:self];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	MCSampleCardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
	cell.cardRadius = 4.0;
    cell.label.numberOfLines = 10;
    NSArray* r = @[@"Los Angeles",@"Miami",@"Costa Rica",@"Cancun",@"Medellin"];
    NSString* destiny = r[indexPath.row];
    cell.label.text = [NSString stringWithFormat:@"%@\n Saliendo Miercoles 3 \nde Oct 5PM llega 8PM despues\n de 4 horas de vuelo\n150 USD por persona ",destiny];
    
	return cell;
}

#pragma mark - MCCardPickerCollectionViewControllerDelegate



- (void)cardPickerCollectionViewController:(MCCardPickerCollectionViewController *)cardPickerCollectionViewController preparePresentingView:(UIView *)presentingView fromSelectedCell:(UICollectionViewCell *)cell
{
	// Let the MCCardPickerCollectionViewController take care of scroll view
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
	scrollView.delegate = cardPickerCollectionViewController;

	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.frame = CGRectMake(20, 900, CGRectGetWidth(self.view.frame)-40, 30);
	[button setTitle:@"Choose Me :)" forState:UIControlStateNormal];
	[button setBackgroundColor:[UIColor colorWithRed:0.15 green:0.65 blue:0.69 alpha:1]];
	[scrollView addSubview:button];
	[scrollView setContentSize:CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetMaxY(button.frame)+100)];
	[presentingView addSubview:scrollView];

	UIImage *blurImage = [(MCSampleCardCollectionViewCell *)cell blurImage];
	presentingView.layer.contents = (id)blurImage.CGImage;
}

@end
