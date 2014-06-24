//
//  CS_EarViewController.h
//  CreatiteScan
//
//  Created by thomas on 15/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CS_EarViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *backgroundImg;
@property (nonatomic, weak) IBOutlet UIImageView *pictoText;
@property (nonatomic, weak) IBOutlet UIImageView *imgTitre;
@property (nonatomic, weak) IBOutlet UIImageView *animTitre;
@property (nonatomic, weak) IBOutlet UIImageView *imgText1;
@property (nonatomic, weak) IBOutlet UIImageView *imgText2;
@property (nonatomic, weak) IBOutlet UIImageView *rotateImg;
@property (nonatomic, weak) IBOutlet UIImageView *animPlayer;
@property (nonatomic, weak) IBOutlet UIImageView *listenImg;
@property (nonatomic, weak) IBOutlet UIImageView *traitImg;

@property (nonatomic, weak) IBOutlet UIButton *okButton;
@property (nonatomic, weak) IBOutlet UIButton *startButton;
@property (nonatomic, weak) IBOutlet UIButton *playButton;
@property (nonatomic, weak) IBOutlet UIButton *stopButton;
@property (nonatomic, weak) IBOutlet UIButton *nextButton;
@property (nonatomic, weak) IBOutlet UIButton *menuButton;

@property (nonatomic,weak) IBOutlet UIProgressView *progressBar;
@property (nonatomic, strong) AVAudioPlayer* player;

-(IBAction)ok:(id)sender;
-(IBAction)start:(id)sender;
-(IBAction)play:(id)sender;
-(IBAction)stop:(id)sender;
-(IBAction)next:(id)sender;
-(IBAction)menu:(id)sender;

@end
