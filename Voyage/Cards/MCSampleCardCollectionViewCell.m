//
//  MCSampleCardCollectionViewCell.m
//  MCCardPickerCollectionViewController
//
//  Created by Michael Chen on 2015/3/4.
//  Copyright (c) 2015年 Michael Chen. All rights reserved.
//

#import "MCSampleCardCollectionViewCell.h"
#import "UIImage+ImageEffects.h"

@implementation MCSampleCardCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {

		self.avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 20, frame.size.width-100, frame.size.width-100)];
		self.avatarImageView.backgroundColor = [UIColor lightGrayColor];
		self.avatarImageView.layer.cornerRadius = CGRectGetHeight(self.avatarImageView.frame)/2;
		self.avatarImageView.layer.masksToBounds = YES;
		/**NSString *URLString = [NSString stringWithFormat:@"http://lorempixel.com/%.0f/%.0f/", CGRectGetWidth(self.avatarImageView.frame), CGRectGetHeight(self.avatarImageView.frame)];
		NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
		[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
			self.avatarImageView.image = [UIImage imageWithData:data];
			self.blurImage = self.avatarImageView.image;
		}];
		[self addSubview:self.avatarImageView];
         */
        
        NSInteger randy  = [self randomNumberBetween:0 maxNumber:4];
        NSArray*arr = @[@"CRC.jpg",@"LAX.jpg",@"MED.jpg",@"MIA22.jpg",@"MIA.jpg"];
        self.avatarImageView.image = [UIImage imageNamed:arr[randy]];
        self.blurImage = self.avatarImageView.image;
        [self addSubview:self.avatarImageView];


		self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.avatarImageView.frame) + 15, frame.size.width, 200)];
		self.label.font = [UIFont systemFontOfSize:15];
		self.label.textColor = [UIColor whiteColor];
		self.label.textAlignment = NSTextAlignmentCenter;
		[self addSubview:self.label];

		self.backgroundView = [[UIView alloc] init];
		self.backgroundView.backgroundColor = [UIColor darkGrayColor];
        [self setBlurImage:[UIImage imageNamed:arr[randy]]];

	}
	return self;
}
- (NSInteger)randomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max
{
    return min + arc4random_uniform(max - min + 1);
}
#pragma mark - Properties

- (void)setCardRadius:(CGFloat)cardRadius
{
	self.layer.cornerRadius = cardRadius;
	self.layer.masksToBounds = YES;
}

- (void)setBlurImage:(UIImage *)originImage
{
	blurImage = [originImage applyBlurWithRadius:30 tintColor:[UIColor colorWithWhite:1.0 alpha:0.3] saturationDeltaFactor:1.8 maskImage:nil];
	self.backgroundView.layer.contents = (id)blurImage.CGImage;
}

@synthesize blurImage;

@end

