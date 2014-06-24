//
//  CS_SommaireViewController.m
//  CreatiteScan
//
//  Created by thomas on 27/05/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import "CS_SommaireViewController.h"
#import "CS_ViewController.h"
#import "CS_SentimentsViewController.h"
#import "CS_ObsViewController.h"
#import "CS_EarViewController.h"
#import "CS_FingerViewController.h"
#import "CS_BrainViewController.h"

@interface CS_SommaireViewController () {
    NSMutableArray *images;
    NSString *str;
}

@end

@implementation CS_SommaireViewController

@synthesize animeFleche;
@synthesize experienceUn;
@synthesize experienceDeux;
@synthesize experienceTrois;
@synthesize experienceQuatre;
@synthesize experienceCinq;

@synthesize startButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)test:(id)sender
{
    self.backImage.alpha = 0;
    self.animeFleche = nil;
    images = nil;
    animeFleche.animationImages = nil;
    CS_SentimentsViewController *third = [self.storyboard instantiateViewControllerWithIdentifier:str];
    [self presentViewController:third animated:YES completion:nil];
}

static int imgAngle = 0;

- (void)doAnimation
{
    self.backImage.alpha = 0.12;

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 0.7;
    animation.repeatCount = INFINITY;
    animation.additive = YES;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.fromValue = [NSNumber numberWithFloat:imgAngle];
    animation.toValue = [NSNumber numberWithFloat:imgAngle + (M_PI_2)];
    [self.circleImage.layer addAnimation:animation forKey:@"90rotation"];

    imgAngle += M_PI / 2;
    if (imgAngle >= M_PI) {
        imgAngle = 0;
    }
}

-(void)moveFrame:(NSInteger)x :(NSInteger)y
{
    CGRect frame = animeFleche.frame;
    frame.origin.x = x;
    frame.origin.y = y;
    animeFleche.frame = frame;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (globalProgress != 0) {
        [startButton setImage:[UIImage imageNamed:@"texte_poursuivre_app.png"] forState:UIControlStateNormal];
    }
 
    switch (globalProgress) {
        case 0:
            animeFleche.alpha = 0;
            str = @"sentimentsViewID";
            break;
        case 1:
            animeFleche.alpha = 1;
            [self moveFrame:257 :680];
            self.animeFleche.transform = CGAffineTransformRotate(self.animeFleche.transform, M_PI / 4.35);
            experienceUn.image = [UIImage imageNamed:@"1_sentiments_activer.png"];
            str = @"sentimentsViewID";
            break;
        case 2:
            animeFleche.alpha = 1;
            [self moveFrame:198 :465];
            self.animeFleche.transform = CGAffineTransformRotate(self.animeFleche.transform, M_PI / 1.65);
            experienceDeux.image = [UIImage imageNamed:@"2_observation_activer.png"];
            str = @"ObsVCID";
            break;
        case 3:
            animeFleche.alpha = 1;
            [self moveFrame:377 :340];
            self.animeFleche.transform = CGAffineTransformRotate(self.animeFleche.transform, M_PI);
            experienceTrois.image = [UIImage imageNamed:@"3_imagination_activer.png"];
            str = @"BrainVCID";
            break;
        case 4:
            animeFleche.alpha = 1;
            [self moveFrame:562 :465];
            self.animeFleche.transform = CGAffineTransformRotate(self.animeFleche.transform, -M_PI / 1.65);
            experienceQuatre.image = [UIImage imageNamed:@"4_construction_activer.png"];
            str = @"FingerVCID";
            break;
        case 5:
            animeFleche.alpha = 1;
            [self moveFrame:501 :680];
            self.animeFleche.transform = CGAffineTransformRotate(self.animeFleche.transform, -M_PI / 4.35);
            experienceCinq.image = [UIImage imageNamed:@"5_ecoute_activer.png"];
            str = @"EarVCID";
            break;
        default:
            animeFleche.alpha = 0;
            str = @"sentimentsViewID";
            break;
    }

    NSArray *animImgNames = @[@"animfleche0001.png", @"animfleche0015.png", @"animfleche0045.png"];

    images = [[NSMutableArray alloc] init];
    for (int i = 0; i < animImgNames.count; i++) {
        [images addObject:[UIImage imageWithContentsOfFile:ResourcePath([animImgNames objectAtIndex:i])]];
    }
    
    animeFleche.animationImages = images;
    animeFleche.animationDuration = 1.5;
    
    [self.view addSubview:animeFleche];
    [animeFleche startAnimating];

    [self doAnimation];
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
