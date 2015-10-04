//
//  ProfileViewController.m
//  Voyage
//
//  Created by Guillermo Vera on 04/10/15.
//  Copyright (c) 2015 memo. All rights reserved.
//

#import "ProfileViewController.h"
#import "CRMotionView.h"
#import "NZCircularImageView.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIButton *okBut;
@property (weak, nonatomic) IBOutlet NZCircularImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *uno;
@property (weak, nonatomic) IBOutlet UILabel *dos;
@property (weak, nonatomic) IBOutlet UILabel *tres;
@property (weak, nonatomic) IBOutlet UILabel *cuatro;
@property (weak, nonatomic) IBOutlet UILabel *cinco;
@property (weak, nonatomic) IBOutlet UILabel *seis;
@property (weak, nonatomic) IBOutlet UILabel *siete;
@property (weak, nonatomic) IBOutlet UIButton *bot1;
@property (weak, nonatomic) IBOutlet UIButton *bot2;

@end

@implementation ProfileViewController
- (IBAction)verRewards:(id)sender
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // basic
    CRMotionView *motionView = [[CRMotionView alloc] initWithFrame:self.view.bounds];
    [motionView setImage:[UIImage imageNamed:@"Kuala_Blur.png"]];
    
    [self.view addSubview:motionView];
    [[self view]bringSubviewToFront:self.okBut];   [[self view]bringSubviewToFront:self.imgView];[[self view]bringSubviewToFront:self.imgView];[[self view]bringSubviewToFront:self.uno];[[self view]bringSubviewToFront:self.dos];[[self view]bringSubviewToFront:self.tres];[[self view]bringSubviewToFront:self.cuatro];[[self view]bringSubviewToFront:self.cinco];[[self view]bringSubviewToFront:self.seis];[[self view]bringSubviewToFront:self.siete];
    [[self view]bringSubviewToFront:self.bot2];
    [[self view]bringSubviewToFront:self.bot1];

}
- (IBAction)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
