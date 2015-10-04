//
//  ViewController.m
//  Voyage
//
//  Created by Guillermo Vera on 03/10/15.
//  Copyright (c) 2015 memo. All rights reserved.
//

#import "ViewController.h"
#import "CRMotionView.h"
#import "AFNetworking.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UIButton *FBView;
@property (weak, nonatomic) IBOutlet UIButton *contBut;

@end

@implementation ViewController
- (IBAction)openfb:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"fb://"];
    [[UIApplication sharedApplication] openURL:url];
    self.contBut.hidden = NO;
}
- (IBAction)continuar:(id)sender
{
    [self performSegueWithIdentifier:@"conteaza" sender:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // basic
       CRMotionView *motionView = [[CRMotionView alloc] initWithFrame:self.view.bounds];
    [motionView setImage:[UIImage imageNamed:@"BP_Blurred.png"]];

    [self.view addSubview:motionView];
    
    [self.view bringSubviewToFront:self.FBView];
    [self.view bringSubviewToFront:self.logoView];[self.view bringSubviewToFront:self.contBut];
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];


    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Tu asistente personal en viajes";
    page1.desc = @"Reservamos toda la experiencia de tu viaje, tu preocupate por disfrutar";
    // custom
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"5 minutos bastan para tener todo listo";
    page2.desc = @"Voyage es tu asistente inteligente, pide todo lo que necesites,presupuesto? rapidez? calidad? tu pide y nosotros nos encargamos de lo demas.";
    page2.titlePositionY = 220;
    page2.descFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    page2.descPositionY = 200;
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    page2.titleIconPositionY = 100;
    NSLog(@"memovoy entrando");
    page1.bgImage = [UIImage imageNamed:@"prague_blur"];
    page2.bgImage = [UIImage imageNamed:@"Voyage_Home"];
    
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"El mundo es tuyo!";
    page3.desc = @"Se acabaron las largas busquedas y altos precios por reservas empieza a ahorrar tiempo y dinero hoy!";
    // custom
    page3.bgImage = [UIImage imageNamed:@"biz.png"];

    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    [intro showInView:self.view animateDuration:0.3];
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
