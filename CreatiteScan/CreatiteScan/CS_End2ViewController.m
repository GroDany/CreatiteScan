//
//  CS_End2ViewController.m
//  CreatiteScan
//
//  Created by thomas on 17/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import "CS_End2ViewController.h"
#import "CS_ViewController.h"
#import "CS_MenuView.h"

@interface CS_End2ViewController ()

@end

@implementation CS_End2ViewController

@synthesize endBackground;
@synthesize rotateImg;
@synthesize loadingView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)onTimer
{
    static int i = 0;
    
    if (i < 0)
        return ;
    else if (i <= 100) {
        loadingView.progress = (float)i / 100;
    } else {
        i = -1;
        exit(EXIT_SUCCESS);
    }
    ++i;
}

-(IBAction)end:(id)sender
{
    endBackground.image = [UIImage imageNamed:@"fond_messageenvoye.jpg"];
    _text1.enabled = NO;
    _text2.enabled = NO;
    _text3.enabled = NO;
    _text4.enabled = NO;
    _text1.alpha = 0;
    _text2.alpha = 0;
    _text3.alpha = 0;
    _text4.alpha = 0;
    _end.alpha = 0;
    _end.enabled = NO;
    rotateImg.alpha = 1;
    loadingView.alpha = 1;
    [self spinLayer:rotateImg.layer duration:3.0 direction:1.0];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.03 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

-(IBAction)menu:(id)sender
{
    CS_MenuView *menuView = [[CS_MenuView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:menuView];
}

-(IBAction)analyse:(id)sender
{
    endBackground.image = [UIImage imageNamed:@"fond_formulaire.jpg"];
    _text1.enabled = YES;
    _text2.enabled = YES;
    _text3.enabled = YES;
    _text4.enabled = YES;
    _analyse.enabled = NO;
    _analyse.alpha = 0;
    _end.enabled = YES;
    [_end setImage:[UIImage imageNamed:@"bouton_envoyer_inactif.png"] forState:UIControlStateNormal];
    [_end setImage:[UIImage imageNamed:@"bouton_envoyer_actif.png"] forState:UIControlStateHighlighted];
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
    
    globalProgress = 0;
    loadingView.alpha = 0;
    
    _end.enabled = NO;
    
    _text1.enabled = NO;
    _text2.enabled = NO;
    _text3.enabled = NO;
    _text4.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [_analyse setImage:[UIImage imageNamed:@"bouton_lerencontrer_inactif.png"] forState:UIControlStateNormal];
    [_analyse setImage:[UIImage imageNamed:@"bouton_lerencontrer_actif.png"] forState:UIControlStateHighlighted];
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
