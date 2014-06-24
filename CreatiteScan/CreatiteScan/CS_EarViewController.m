//
//  CS_EarViewController.m
//  CreatiteScan
//
//  Created by thomas on 15/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import "CS_EarViewController.h"
#import "CS_ViewController.h"
#import "CS_EndViewController.h"
#import "CS_MenuView.h"

@interface CS_EarViewController () {
    NSData *audioFile;
}

@end

@implementation CS_EarViewController

@synthesize backgroundImg;
@synthesize imgTitre;
@synthesize animTitre;
@synthesize pictoText;
@synthesize imgText1;
@synthesize imgText2;
@synthesize rotateImg;
@synthesize animPlayer;
@synthesize listenImg;
@synthesize traitImg;
@synthesize progressBar;
@synthesize startButton;
@synthesize nextButton;
@synthesize okButton;
@synthesize playButton;
@synthesize stopButton;
@synthesize menuButton;
@synthesize player;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)onRec
{
    static int it = 0;
    
    if (it <= 100) {
        progressBar.progress = (float)it / 100.0;
        if (it == 100) {
            progressBar.progress = 0;
        }
        ++it;
    }
}

-(IBAction)menu:(id)sender
{
    CS_MenuView *menuView = [[CS_MenuView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:menuView];
}

-(IBAction)ok:(id)sender
{
    pictoText.alpha = 0;
    okButton.enabled = NO;
    okButton.alpha = 0;
    backgroundImg.image = [UIImage imageNamed:@"fond_rec1.jpg"];
    imgText1.alpha = 1;
    startButton.enabled = YES;
    rotateImg.alpha = 1;
}

-(IBAction)start:(id)sender
{
    backgroundImg.image = [UIImage imageNamed:@"fond_rec2_new.jpg"];
    imgText1.alpha = 0;
    imgText2.alpha = 1;
    startButton.enabled = NO;
    [self spinLayer:rotateImg.layer duration:25.0 direction:1];
    progressBar.alpha = 1;
    [NSTimer scheduledTimerWithTimeInterval: 0.25 target:self selector:@selector(onRec) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval: 25.0 target:self selector:@selector(onTimer1) userInfo:nil repeats:NO];
}

-(IBAction)next:(id)sender
{
    player = nil;
    audioFile = nil;
    CS_EndViewController *fourth = [self.storyboard instantiateViewControllerWithIdentifier:@"EndVCID"];
    [self presentViewController:fourth animated:YES completion:nil];
}

int status = -1;
int progress = 1;

BOOL play = NO;

-(IBAction)play:(id)sender
{
    if (status == -1) {
        [NSTimer scheduledTimerWithTimeInterval: 25.0 / 130.0 target:self selector:@selector(onTimer2) userInfo:nil repeats:YES];
        status = 0;
    }
    if (status == 0) {
        status = 1;
        [player play];
        [playButton setImage:[UIImage imageNamed:@"bouton_pause.png"] forState:UIControlStateNormal];
        play = YES;
    }
    else {
        status = 0;
        [player pause];
        play = NO;
        [playButton setImage:[UIImage imageNamed:@"bouton_play.png"] forState:UIControlStateNormal];
    }
}

-(IBAction)stop:(id)sender
{
    status = 0;
    progress = 1;
    play = NO;
    [player stop];
    player.currentTime = 0.0;
    [playButton setImage:[UIImage imageNamed:@"bouton_play.png"] forState:UIControlStateNormal];
}

-(void)onTimer1
{
    progressBar.frame = CGRectMake(267, 861, 249, 2);
    audioFile = [NSData dataWithContentsOfFile:ResourcePath(@"CreatiteScanApp_PersistanceAuditive.mp3")];
    player = [[AVAudioPlayer alloc] initWithData:audioFile error:nil];
    imgText2.alpha = 0;
    backgroundImg.image = [UIImage imageNamed:@"nouveaufond_oreille.jpg"];
    nextButton.alpha = 1;
    listenImg.alpha = 1;
    traitImg.alpha = 1;
    animPlayer.alpha = 1;
    playButton.alpha = 1;
    stopButton.alpha = 1;
    rotateImg.alpha = 0;
    [stopButton setImage:[UIImage imageNamed:@"bouton_stop_inactif.png"] forState:UIControlStateNormal];
    [stopButton setImage:[UIImage imageNamed:@"bouton_stop_actif.png"] forState:UIControlStateHighlighted];
    playButton.enabled = YES;
    stopButton.enabled = YES;
}

-(void)onTimer2
{
    animPlayer.image = [UIImage imageNamed:[NSString stringWithFormat:@"anim_player%04d.png", progress]];
    if (play == YES) {
        progressBar.progress = (float)progress / 130.0;
    }
    if (play == NO)
        return ;
    ++progress;
    if (progress > 130) {
        progress = 1;
        status = 0;
        play = NO;
        [player stop];
        [playButton setImage:[UIImage imageNamed:@"bouton_play.png"] forState:UIControlStateNormal];
        nextButton.enabled = YES;
        [nextButton setImage:[UIImage imageNamed:@"bouton_terminer_inactif.png"] forState:UIControlStateNormal];
        [nextButton setImage:[UIImage imageNamed:@"bouton_terminer_actif.png"] forState:UIControlStateHighlighted];
    }
}

-(void)animTitle
{
    static int i = 1;
    
    if (i == 137)
        i = 1;
    animTitre.image = nil;
    animTitre.image = [UIImage imageNamed:[NSString stringWithFormat:@"anim_titre_oreille%04d.png", i]];
    ++i;
}

- (void)spinLayer:(CALayer *)inLayer duration:(CFTimeInterval)inDuration
        direction:(int)direction
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * direction];
    rotationAnimation.duration = inDuration;
    rotationAnimation.timingFunction =
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [inLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    globalProgress = 5;
    
    nextButton.alpha = 0;
    
    [okButton setImage:[UIImage imageNamed:@"boutonOk_pasactif.png"] forState:UIControlStateNormal];
    [okButton setImage:[UIImage imageNamed:@"boutonOk_actif.png"] forState:UIControlStateHighlighted];
    
    NSArray *titreImgAnim = @[@"titre_oreille.png", @"titre_oreille2.png"];
    
    NSMutableArray *imgAnim = [[NSMutableArray alloc] init];
    for (int i = 0; i < titreImgAnim.count; i++) {
        [imgAnim addObject:[UIImage imageNamed:[titreImgAnim objectAtIndex:i]]];
    }
    
    imgTitre.animationImages = imgAnim;
    imgTitre.animationDuration = 1;
    
    [self.view addSubview:imgTitre];
    [imgTitre startAnimating];
    imgAnim = nil;

    [NSTimer scheduledTimerWithTimeInterval: 5.0/136.0 target:self selector:@selector(animTitle) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
