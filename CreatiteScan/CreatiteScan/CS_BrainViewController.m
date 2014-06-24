//
//  CS_BrainViewController.m
//  CreatiteScan
//
//  Created by thomas on 14/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import "CS_BrainViewController.h"
#import "CS_ViewController.h"
#import "CS_EarViewController.h"
#import "CS_MenuView.h"

@interface CS_BrainViewController ()

@end

@implementation CS_BrainViewController

@synthesize backgroundOne;
@synthesize backgroundTwo;
@synthesize imgTitre;
@synthesize animTitre;
@synthesize pictoText;
@synthesize animLeft;
@synthesize animRight;
@synthesize unityImg1;
@synthesize unityImg2;
@synthesize valueImg1;
@synthesize valueImg2;
@synthesize okButton;
@synthesize startButton;
@synthesize endButton;
@synthesize menuButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSArray *)getAnimTitle
{
    NSArray *animeTitleImg = @[@"anim_titre_cerveau0001.png", @"anim_titre_cerveau0002.png", @"anim_titre_cerveau0003.png", @"anim_titre_cerveau0004.png", @"anim_titre_cerveau0005.png", @"anim_titre_cerveau0006.png",
                               @"anim_titre_cerveau0007.png", @"anim_titre_cerveau0008.png", @"anim_titre_cerveau0009.png", @"anim_titre_cerveau0010.png", @"anim_titre_cerveau0011.png", @"anim_titre_cerveau0012.png",
                               @"anim_titre_cerveau0013.png", @"anim_titre_cerveau0014.png", @"anim_titre_cerveau0015.png", @"anim_titre_cerveau0016.png", @"anim_titre_cerveau0017.png", @"anim_titre_cerveau0018.png",
                               @"anim_titre_cerveau0019.png", @"anim_titre_cerveau0020.png", @"anim_titre_cerveau0021.png", @"anim_titre_cerveau0022.png", @"anim_titre_cerveau0023.png", @"anim_titre_cerveau0024.png",
                               @"anim_titre_cerveau0025.png", @"anim_titre_cerveau0026.png", @"anim_titre_cerveau0027.png", @"anim_titre_cerveau0028.png", @"anim_titre_cerveau0029.png", @"anim_titre_cerveau0030.png",
                               @"anim_titre_cerveau0031.png", @"anim_titre_cerveau0032.png", @"anim_titre_cerveau0033.png", @"anim_titre_cerveau0034.png", @"anim_titre_cerveau0035.png", @"anim_titre_cerveau0036.png",
                               @"anim_titre_cerveau0037.png", @"anim_titre_cerveau0038.png", @"anim_titre_cerveau0039.png", @"anim_titre_cerveau0040.png", @"anim_titre_cerveau0041.png", @"anim_titre_cerveau0042.png",
                               @"anim_titre_cerveau0043.png", @"anim_titre_cerveau0044.png", @"anim_titre_cerveau0045.png", @"anim_titre_cerveau0046.png", @"anim_titre_cerveau0047.png", @"anim_titre_cerveau0048.png",
                               @"anim_titre_cerveau0049.png", @"anim_titre_cerveau0050.png", @"anim_titre_cerveau0051.png", @"anim_titre_cerveau0052.png", @"anim_titre_cerveau0053.png", @"anim_titre_cerveau0054.png",
                               @"anim_titre_cerveau0055.png", @"anim_titre_cerveau0056.png", @"anim_titre_cerveau0057.png", @"anim_titre_cerveau0058.png", @"anim_titre_cerveau0059.png", @"anim_titre_cerveau0060.png",
                               @"anim_titre_cerveau0061.png", @"anim_titre_cerveau0062.png", @"anim_titre_cerveau0063.png", @"anim_titre_cerveau0064.png", @"anim_titre_cerveau0065.png", @"anim_titre_cerveau0066.png",
                               @"anim_titre_cerveau0067.png", @"anim_titre_cerveau0068.png", @"anim_titre_cerveau0069.png", @"anim_titre_cerveau0070.png", @"anim_titre_cerveau0071.png", @"anim_titre_cerveau0072.png",
                               @"anim_titre_cerveau0073.png", @"anim_titre_cerveau0074.png", @"anim_titre_cerveau0075.png", @"anim_titre_cerveau0076.png", @"anim_titre_cerveau0077.png", @"anim_titre_cerveau0078.png",
                               @"anim_titre_cerveau0079.png", @"anim_titre_cerveau0080.png", @"anim_titre_cerveau0081.png", @"anim_titre_cerveau0082.png", @"anim_titre_cerveau0083.png", @"anim_titre_cerveau0084.png",
                               @"anim_titre_cerveau0085.png", @"anim_titre_cerveau0086.png", @"anim_titre_cerveau0087.png", @"anim_titre_cerveau0088.png", @"anim_titre_cerveau0089.png", @"anim_titre_cerveau0090.png",
                               @"anim_titre_cerveau0091.png", @"anim_titre_cerveau0092.png", @"anim_titre_cerveau0093.png", @"anim_titre_cerveau0094.png", @"anim_titre_cerveau0095.png", @"anim_titre_cerveau0096.png",
                               @"anim_titre_cerveau0097.png", @"anim_titre_cerveau0098.png", @"anim_titre_cerveau0099.png", @"anim_titre_cerveau0100.png", @"anim_titre_cerveau0101.png", @"anim_titre_cerveau0102.png",
                               @"anim_titre_cerveau0103.png", @"anim_titre_cerveau0104.png", @"anim_titre_cerveau0105.png", @"anim_titre_cerveau0106.png", @"anim_titre_cerveau0107.png", @"anim_titre_cerveau0108.png",
                               @"anim_titre_cerveau0109.png", @"anim_titre_cerveau0110.png", @"anim_titre_cerveau0111.png", @"anim_titre_cerveau0112.png", @"anim_titre_cerveau0113.png", @"anim_titre_cerveau0114.png",
                               @"anim_titre_cerveau0115.png", @"anim_titre_cerveau0116.png", @"anim_titre_cerveau0117.png", @"anim_titre_cerveau0118.png", @"anim_titre_cerveau0119.png", @"anim_titre_cerveau0120.png",
                               @"anim_titre_cerveau0121.png", @"anim_titre_cerveau0122.png", @"anim_titre_cerveau0123.png", @"anim_titre_cerveau0124.png", @"anim_titre_cerveau0125.png", @"anim_titre_cerveau0126.png",
                               @"anim_titre_cerveau0127.png", @"anim_titre_cerveau0128.png", @"anim_titre_cerveau0129.png", @"anim_titre_cerveau0130.png", @"anim_titre_cerveau0131.png", @"anim_titre_cerveau0132.png",
                               @"anim_titre_cerveau0133.png", @"anim_titre_cerveau0134.png", @"anim_titre_cerveau0135.png", @"anim_titre_cerveau0136.png"];
    
    return animeTitleImg;
}

-(IBAction)menu:(id)sender
{
    CS_MenuView *menuView = [[CS_MenuView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:menuView];
}

-(IBAction)ok:(id)sender
{
    backgroundOne.image = nil;
    backgroundOne.image = [UIImage imageNamed:@"fond_cerveau1.jpg"];
    pictoText.alpha = 0;
    okButton.enabled = NO;
    okButton.alpha = 0;
    animLeft.alpha = 1;
    animRight.alpha = 1;
    startButton.enabled = YES;
    startButton.alpha = 1;
    unityImg1.alpha = 1;
    unityImg2.alpha = 1;
    valueImg1.alpha = 1;
    valueImg2.alpha = 1;
}

-(IBAction)start:(id)sender
{
    startButton.enabled = NO;
    [NSTimer scheduledTimerWithTimeInterval: 3.4/43.0 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval: 1.0/10.0 target:self selector:@selector(onTimer2) userInfo:nil repeats:YES];
}

-(IBAction)end:(id)sender
{
    animLeft = nil;
    animRight = nil;
    valueImg1 = nil;
    valueImg1 = nil;
    CS_EarViewController *sixth = [self.storyboard instantiateViewControllerWithIdentifier:@"FingerVCID"];
    [self presentViewController:sixth animated:YES completion:nil];
}

-(void)onTimer
{
    static int i = 1;
    static BOOL stop = YES;
    static float alpha = 0.f;
    
    alpha = (float)i / 44;
    if (stop == NO)
        return ;
    if (i < 39) {
        valueImg1.image = nil;
        valueImg1.image = [UIImage imageNamed:[NSString stringWithFormat:@"chiffres%04d.png", i]];
    }
    if (i < 45) {
        valueImg2.image = nil;
        valueImg2.image = [UIImage imageNamed:[NSString stringWithFormat:@"chiffres%04d.png", i]];
    }
    backgroundTwo.alpha = alpha;
    if (i > 44)
        stop = NO;
    ++i;
}

-(void)onTimer2
{
    static int i = 1;
    static BOOL stop = YES;
    
    if (stop == NO)
        return ;
    if (i < 27) {
        animLeft.image = nil;
        animLeft.image = [UIImage imageNamed:[NSString stringWithFormat:@"animcerveaufroid%04d.png", i]];
    }
    if (i < 35) {
        animRight.image = nil;
        animRight.image = [UIImage imageNamed:[NSString stringWithFormat:@"animcerveauchaud%04d.png", i]];
    }
    if (i == 35) {
        stop = NO;
        [endButton setImage:[UIImage imageNamed:@"boutonprochainsens_inactif.png"] forState:UIControlStateNormal];
        [endButton setImage:[UIImage imageNamed:@"boutonprochainsens_actif.png"] forState:UIControlStateHighlighted];
        endButton.enabled = YES;
        endButton.alpha = 1;
        startButton.alpha = 0;
    }
    ++i;
}

-(void)animTitle
{
    static int i = 1;
    
    if (i == 137)
        i = 1;
    animTitre.image = nil;
    animTitre.image = [UIImage imageNamed:[NSString stringWithFormat:@"anim_titre_cerveau%04d.png", i]];
    ++i;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    globalProgress = 3;
    
    [okButton setImage:[UIImage imageNamed:@"boutonOk_pasactif.png"] forState:UIControlStateNormal];
    [okButton setImage:[UIImage imageNamed:@"boutonOk_actif.png"] forState:UIControlStateHighlighted];
    [startButton setImage:[UIImage imageNamed:@"boutonmesurer_inactif.png"] forState:UIControlStateNormal];
    [startButton setImage:[UIImage imageNamed:@"boutonpmesurer_actif.png"] forState:UIControlStateHighlighted];
    
    NSArray *titreImgAnim = @[@"titre_cerveau.png", @"titre_cerveau2.png"];
    
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
