//
//  CS_SentimentsViewController.m
//  CreatiteScan
//
//  Created by thomas on 31/05/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import "CS_SentimentsViewController.h"
#import "CS_ViewController.h"
#import "CS_ObsViewController.h"
#import "CS_FingerViewController.h"
#import "CS_MenuView.h"

@interface CS_SentimentsViewController () {
    NSMutableArray *animExp;
    int count;
}

@end

@implementation CS_SentimentsViewController

@synthesize sentimentBackground;
@synthesize menuBackground;
@synthesize picto;
@synthesize titreImage;
@synthesize titreAnim;
@synthesize cardioImage;
@synthesize cardioAnim;
@synthesize imgPuls;
@synthesize startButton;
@synthesize menuButton;
@synthesize nextButton;
@synthesize percentLabel;

BOOL isAnim = NO;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSArray *)getCardioAnim1
{
    NSArray *animCardio = @[@"anim_graphic1_coeur0001.png", @"anim_graphic1_coeur0002.png", @"anim_graphic1_coeur0003.png", @"anim_graphic1_coeur0004.png", @"anim_graphic1_coeur0005.png", @"anim_graphic1_coeur0006.png",
                                @"anim_graphic1_coeur0007.png", @"anim_graphic1_coeur0008.png", @"anim_graphic1_coeur0009.png", @"anim_graphic1_coeur0010.png", @"anim_graphic1_coeur0011.png", @"anim_graphic1_coeur0012.png",
                                @"anim_graphic1_coeur0013.png", @"anim_graphic1_coeur0014.png", @"anim_graphic1_coeur0015.png", @"anim_graphic1_coeur0016.png", @"anim_graphic1_coeur0017.png", @"anim_graphic1_coeur0018.png",
                                @"anim_graphic1_coeur0019.png", @"anim_graphic1_coeur0020.png", @"anim_graphic1_coeur0021.png", @"anim_graphic1_coeur0022.png", @"anim_graphic1_coeur0023.png", @"anim_graphic1_coeur0024.png",
                                @"anim_graphic1_coeur0025.png", @"anim_graphic1_coeur0026.png", @"anim_graphic1_coeur0027.png", @"anim_graphic1_coeur0028.png", @"anim_graphic1_coeur0029.png", @"anim_graphic1_coeur0030.png",
                                @"anim_graphic1_coeur0031.png", @"anim_graphic1_coeur0032.png", @"anim_graphic1_coeur0033.png", @"anim_graphic1_coeur0034.png", @"anim_graphic1_coeur0035.png", @"anim_graphic1_coeur0036.png",
                                @"anim_graphic1_coeur0037.png", @"anim_graphic1_coeur0038.png", @"anim_graphic1_coeur0039.png", @"anim_graphic1_coeur0040.png", @"anim_graphic1_coeur0041.png", @"anim_graphic1_coeur0042.png",
                                @"anim_graphic1_coeur0043.png", @"anim_graphic1_coeur0044.png", @"anim_graphic1_coeur0045.png", @"anim_graphic1_coeur0046.png", @"anim_graphic1_coeur0047.png", @"anim_graphic1_coeur0048.png",
                                @"anim_graphic1_coeur0049.png", @"anim_graphic1_coeur0050.png", @"anim_graphic1_coeur0051.png", @"anim_graphic1_coeur0052.png", @"anim_graphic1_coeur0053.png", @"anim_graphic1_coeur0054.png",
                                @"anim_graphic1_coeur0055.png", @"anim_graphic1_coeur0056.png", @"anim_graphic1_coeur0057.png", @"anim_graphic1_coeur0058.png", @"anim_graphic1_coeur0059.png", @"anim_graphic1_coeur0060.png",
                                @"anim_graphic1_coeur0061.png", @"anim_graphic1_coeur0062.png", @"anim_graphic1_coeur0063.png", @"anim_graphic1_coeur0064.png", @"anim_graphic1_coeur0065.png", @"anim_graphic1_coeur0066.png",
                                @"anim_graphic1_coeur0067.png", @"anim_graphic1_coeur0068.png", @"anim_graphic1_coeur0069.png", @"anim_graphic1_coeur0070.png", @"anim_graphic1_coeur0071.png", @"anim_graphic1_coeur0072.png",
                                @"anim_graphic1_coeur0073.png", @"anim_graphic1_coeur0074.png", @"anim_graphic1_coeur0075.png", @"anim_graphic1_coeur0076.png", @"anim_graphic1_coeur0077.png", @"anim_graphic1_coeur0078.png",
                                @"anim_graphic1_coeur0079.png", @"anim_graphic1_coeur0080.png", @"anim_graphic1_coeur0081.png", @"anim_graphic1_coeur0082.png"];

    return animCardio;
}

-(NSArray *)getCardioAnim2
{
    NSArray *animCardio = @[@"anim_graphic2_coeur0001.png", @"anim_graphic2_coeur0002.png", @"anim_graphic2_coeur0003.png", @"anim_graphic2_coeur0004.png", @"anim_graphic2_coeur0005.png", @"anim_graphic2_coeur0006.png",
                            @"anim_graphic2_coeur0007.png", @"anim_graphic2_coeur0008.png", @"anim_graphic2_coeur0009.png", @"anim_graphic2_coeur0010.png", @"anim_graphic2_coeur0011.png", @"anim_graphic2_coeur0012.png",
                            @"anim_graphic2_coeur0013.png", @"anim_graphic2_coeur0014.png", @"anim_graphic2_coeur0015.png", @"anim_graphic2_coeur0016.png", @"anim_graphic2_coeur0017.png", @"anim_graphic2_coeur0018.png",
                            @"anim_graphic2_coeur0019.png", @"anim_graphic2_coeur0020.png", @"anim_graphic2_coeur0021.png", @"anim_graphic2_coeur0022.png", @"anim_graphic2_coeur0023.png", @"anim_graphic2_coeur0024.png",
                            @"anim_graphic2_coeur0025.png", @"anim_graphic2_coeur0026.png", @"anim_graphic2_coeur0027.png", @"anim_graphic2_coeur0028.png", @"anim_graphic2_coeur0029.png", @"anim_graphic2_coeur0030.png",
                            @"anim_graphic2_coeur0031.png", @"anim_graphic2_coeur0032.png", @"anim_graphic2_coeur0033.png", @"anim_graphic2_coeur0034.png", @"anim_graphic2_coeur0035.png", @"anim_graphic2_coeur0036.png",
                            @"anim_graphic2_coeur0037.png", @"anim_graphic2_coeur0038.png", @"anim_graphic2_coeur0039.png", @"anim_graphic2_coeur0040.png", @"anim_graphic2_coeur0041.png", @"anim_graphic2_coeur0042.png",
                            @"anim_graphic2_coeur0043.png", @"anim_graphic2_coeur0044.png", @"anim_graphic2_coeur0045.png", @"anim_graphic2_coeur0046.png", @"anim_graphic2_coeur0047.png", @"anim_graphic2_coeur0048.png",
                            @"anim_graphic2_coeur0049.png", @"anim_graphic2_coeur0050.png", @"anim_graphic2_coeur0051.png", @"anim_graphic2_coeur0052.png", @"anim_graphic2_coeur0053.png", @"anim_graphic2_coeur0054.png",
                            @"anim_graphic2_coeur0055.png", @"anim_graphic2_coeur0056.png", @"anim_graphic2_coeur0057.png", @"anim_graphic2_coeur0058.png", @"anim_graphic2_coeur0059.png", @"anim_graphic2_coeur0060.png",
                            @"anim_graphic2_coeur0061.png", @"anim_graphic2_coeur0062.png", @"anim_graphic2_coeur0063.png", @"anim_graphic2_coeur0064.png", @"anim_graphic2_coeur0065.png", @"anim_graphic2_coeur0066.png",
                            @"anim_graphic2_coeur0067.png", @"anim_graphic2_coeur0068.png", @"anim_graphic2_coeur0069.png", @"anim_graphic2_coeur0070.png", @"anim_graphic2_coeur0071.png", @"anim_graphic2_coeur0072.png",
                            @"anim_graphic2_coeur0073.png", @"anim_graphic2_coeur0074.png", @"anim_graphic2_coeur0075.png", @"anim_graphic2_coeur0076.png", @"anim_graphic2_coeur0077.png", @"anim_graphic2_coeur0078.png",
                            @"anim_graphic2_coeur0079.png", @"anim_graphic2_coeur0080.png", @"anim_graphic2_coeur0081.png", @"anim_graphic2_coeur0082.png"];
    
    return animCardio;
}

-(IBAction)next:(id)sender
{
    animExp = nil;
    cardioAnim.animationImages = nil;
    titreImage.animationImages = nil;
    CS_FingerViewController *fourth = [self.storyboard instantiateViewControllerWithIdentifier:@"ObsVCID"];
    [self presentViewController:fourth animated:YES completion:nil];
}

-(IBAction)start:(id)sender
{
    self.picto.alpha = 0;
    self.startButton.alpha = 0;
    self.startButton.enabled = NO;
    sentimentBackground.image = nil;
    self.sentimentBackground.image = [UIImage imageNamed:@"fond_et_image2.jpg"];
    self.cardioImage.alpha = 1;
    self.imgPuls.alpha = 1;
    self.percentLabel.alpha = 1;

    self.cardioAnim.alpha = 1;
    NSArray *cardioAnimImg = [self getCardioAnim2];
    
    animExp = [[NSMutableArray alloc] init];
    for (int i = 0; i < cardioAnimImg.count; i++) {
        [animExp addObject:[UIImage imageWithContentsOfFile:ResourcePath([cardioAnimImg objectAtIndex:i])]];
    }
    
    cardioAnim.animationImages = animExp;
    cardioAnim.animationDuration = 3;
    cardioAnim.animationRepeatCount = 1;

    [self.view addSubview:cardioAnim];
    [cardioAnim startAnimating];
    isAnim = YES;
}

-(IBAction)menu:(id)sender
{
    isOnMenu = YES;
    CS_MenuView *menuView = [[CS_MenuView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:menuView];
}

-(void)update
{
    if (![self.cardioAnim isAnimating] && isAnim == YES && count < 5)
    {
        NSArray *cardioAnimImg;
        
        sentimentBackground.image = nil;
        switch (count) {
            case 1:
                sentimentBackground.image = [UIImage imageNamed:@"screen_mamie.jpg"];
                percentLabel.image = [UIImage imageNamed:@"chiffres0028.png"];
                cardioAnimImg = [self getCardioAnim2];
                break;
            case 2:
                sentimentBackground.image = [UIImage imageNamed:@"screen_seguela.jpg"];
                percentLabel.image = [UIImage imageNamed:@"chiffres0102.png"];
                cardioAnimImg = [self getCardioAnim1];
                break;
            case 3:
                sentimentBackground.image = [UIImage imageNamed:@"screen_paysage.jpg"];
                percentLabel.image = [UIImage imageNamed:@"chiffres0034.png"];
                cardioAnimImg = [self getCardioAnim2];
                break;
            case 4:
                sentimentBackground.image = [UIImage imageNamed:@"screen_fruits.jpg"];
                percentLabel.image = [UIImage imageNamed:@"chiffres0031.png"];
                cardioAnimImg = [self getCardioAnim2];
                break;
            default:
                break;
        }
        animExp = nil;
        cardioAnim.animationImages = nil;
        
        animExp = [[NSMutableArray alloc] init];
        for (int i = 0; i < cardioAnimImg.count; i++) {
            [animExp addObject:[UIImage imageWithContentsOfFile:ResourcePath([cardioAnimImg objectAtIndex:i])]];
        }
        
        cardioAnim.animationImages = animExp;
        cardioAnim.animationDuration = 3;
        cardioAnim.animationRepeatCount = 1;
        
        [self.view addSubview:cardioAnim];
        [cardioAnim startAnimating];
        ++count;
    }
    else if (![self.cardioAnim isAnimating] && count == 5)
    {
        [nextButton setImage:[UIImage imageNamed:@"boutonprochainsens_inactif.png"] forState:UIControlStateNormal];
        [nextButton setImage:[UIImage imageNamed:@"boutonprochainsens_actif.png"] forState:UIControlStateHighlighted];
        nextButton.enabled = YES;
        nextButton.alpha = 1;
        ++count;
    }
}

-(void)onTimer
{
    if (isOnMenu == YES)
        return ;
    [self update];
}

-(void)animTitle
{
    static int i = 1;

    if (i == 137)
        i = 1;
    titreAnim.image = nil;
    titreAnim.image = [UIImage imageNamed:[NSString stringWithFormat:@"anim_titre_coeur%04d.png", i]];
    ++i;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    globalProgress = 1;
    count = 1;
    
    [startButton setImage:[UIImage imageNamed:@"boutonOk_pasactif.png"] forState:UIControlStateNormal];
    [startButton setImage:[UIImage imageNamed:@"boutonOk_actif.png"] forState:UIControlStateHighlighted];
    
    [NSTimer scheduledTimerWithTimeInterval: 5.0/136.0 target:self selector:@selector(animTitle) userInfo:nil repeats:YES];
    
    NSArray *titreImgAnim = @[@"titre_sentiments.png", @"titre_sentiments2.png"];

    NSMutableArray *imgAnim = [[NSMutableArray alloc] init];
    for (int i = 0; i < titreImgAnim.count; i++) {
        [imgAnim addObject:[UIImage imageNamed:[titreImgAnim objectAtIndex:i]]];
    }

    titreImage.animationImages = imgAnim;
    titreImage.animationDuration = 1;
    
    [self.view addSubview:titreImage];
    [titreImage startAnimating];
    imgAnim = nil;

    [NSTimer scheduledTimerWithTimeInterval: 1.0/30.0 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
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
