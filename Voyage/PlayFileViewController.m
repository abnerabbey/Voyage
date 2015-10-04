//
//  PlayFileViewController.m
//  EZAudioPlayFileExample
//
//  Created by Syed Haris Ali on 12/16/13.
//  Copyright (c) 2013 Syed Haris Ali. All rights reserved.
//

#import "PlayFileViewController.h"
#import "CRMotionView.h"
#import "ProfileViewController.h"


@interface PlayFileViewController (){
  float  *_waveformData;
  UInt32 _waveformDrawingIndex;
  UInt32 _waveformFrameRate;
  UInt32 _waveformTotalBuffers;
    __weak IBOutlet UIButton *siributt;
    __weak IBOutlet UILabel *helpLabel;
    __weak IBOutlet UIButton *profBut;
}
@end

@implementation PlayFileViewController
@synthesize recognition;
@synthesize audioFile = _audioFile;
@synthesize audioPlot = _audioPlot;
@synthesize eof = _eof;
@synthesize framePositionSlider = _framePositionSlider;
- (IBAction)siributt:(id)sender {
}


#pragma mark - Initialization
-(id)init {
  self = [super init];
  if(self){
    [self initializeViewController];
  }
  return self;
}
- (IBAction)showProfile:(id)sender
{
    ProfileViewController* vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"profile"];
    [self presentViewController:vc animated:vc completion:nil];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if(self){
    [self initializeViewController];
  }
  return self;
}

#pragma mark - Initialize View Controller Here
-(void)initializeViewController {
}

#pragma mark - Customize the Audio Plot
-(void)viewDidLoad {
  
  [super viewDidLoad];
  
  /*
   Customizing the audio plot's look
   */
  // Background color
  self.audioPlot.backgroundColor = [UIColor clearColor];
  // Waveform color
  self.audioPlot.color           = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  // Plot type
  self.audioPlot.plotType        = EZPlotTypeRolling;
  // Fill
  self.audioPlot.shouldFill      = YES;
  // Mirror
  self.audioPlot.shouldMirror    = YES;
    
    self.audioPlot.maxAmplitude = 1/5.0;
  /*
   Try opening the sample file
   */

    
    // basic
    CRMotionView *motionView = [[CRMotionView alloc] initWithFrame:self.view.bounds];
    [motionView setImage:[UIImage imageNamed:@"BP_Blurred.png"]];
    
    [self.view addSubview:motionView];
    [self.view bringSubviewToFront:self.audioPlot];
     [self.view bringSubviewToFront:profBut];
    [self.view bringSubviewToFront:siributt];
    [self.view bringSubviewToFront:helpLabel];
    [self performSelector:@selector(showHelp) withObject:self afterDelay:0.7 ];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [siributt addGestureRecognizer:longPress];


}

- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        NSLog(@"Long Press");
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);

        [self performSegueWithIdentifier:@"memo" sender:nil];
    }
}

-(void)showHelp
{
    [UIView animateWithDuration:2.0 animations:^(void) {
        helpLabel
        .alpha = 1;
    }];
}
#pragma - mark iSpeech Del
- (IBAction)passconver:(id)sender
{
    recognition = [[ISSpeechRecognition alloc] init];
    
    recognition.freeformType = ISFreeFormTypeDictation;
    

    NSError *err;
    [recognition setDelegate:self];
    [recognition setLocale:ISLocaleMXSpanish];
    
    if(![recognition listenAndRecognizeWithTimeout:10 error:&err]) {
        NSLog(@"ERROR: %@", err);
    }
    
}

- (void)recognition:(ISSpeechRecognition *)speechRecognition didGetRecognitionResult:(ISSpeechRecognitionResult *)result {
    NSLog(@"Method: %@", NSStringFromSelector(_cmd));
    NSLog(@"Result: %@", result.text);
    
    [helpLabel setText:result.text];
    
    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    [def setObject:helpLabel.text forKey:@"stringResult"];
    [def setBool:YES forKey:@"yable"];
    [def synchronize];
    [self performSegueWithIdentifier:@"memo" sender:@"nil"];
}

- (void)recognition:(ISSpeechRecognition *)speechRecognition didFailWithError:(NSError *)error {
    NSLog(@"Method: %@", NSStringFromSelector(_cmd));
    NSLog(@"Error: %@", error);
}

- (void)recognitionCancelledByUser:(ISSpeechRecognition *)speechRecognition {
    NSLog(@"Method: %@", NSStringFromSelector(_cmd));
}

- (void)recognitionDidBeginRecording:(ISSpeechRecognition *)speechRecognition {
    NSLog(@"Method: %@", NSStringFromSelector(_cmd));
}

- (void)recognitionDidFinishRecording:(ISSpeechRecognition *)speechRecognition {
    NSLog(@"Method: %@", NSStringFromSelector(_cmd));
}



@end