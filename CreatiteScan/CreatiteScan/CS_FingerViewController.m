//
//  CS_FingerViewController.m
//  CreatiteScan
//
//  Created by thomas on 11/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import "CS_FingerViewController.h"
#import "CS_ViewController.h"
#import "CS_ViewController.h"
#import "CS_MenuView.h"

@interface CS_FingerViewController () {
    NSMutableArray *animExp;
    NSMutableArray *titleAnim;
    NSMutableArray *animUsure1;
    NSMutableArray *animUsure2;
    NSMutableArray *animUsure3;
}

@end

@implementation CS_FingerViewController

@synthesize backgroundFinger;
@synthesize titreFinger;
@synthesize animFinger;
@synthesize animEmpreinte;
@synthesize imgUsure1;
@synthesize imgUsure2;
@synthesize imgUsure3;
@synthesize textUsure1;
@synthesize textUsure2;
@synthesize textUsure3;
@synthesize traitUn;
@synthesize traitDeux;
@synthesize resultImg;

@synthesize startButton;
@synthesize menuButton;
@synthesize expButton;
@synthesize okButton;

BOOL isAnimated = NO;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSArray *)getTitleAnim
{
    NSArray *array = @[@"anim_titre_doigt0001.png", @"anim_titre_doigt0002.png", @"anim_titre_doigt0003.png", @"anim_titre_doigt0004.png", @"anim_titre_doigt0005.png", @"anim_titre_doigt0006.png",
                       @"anim_titre_doigt0007.png", @"anim_titre_doigt0008.png", @"anim_titre_doigt0009.png", @"anim_titre_doigt0010.png", @"anim_titre_doigt0011.png", @"anim_titre_doigt0012.png",
                       @"anim_titre_doigt0013.png", @"anim_titre_doigt0014.png", @"anim_titre_doigt0015.png", @"anim_titre_doigt0016.png", @"anim_titre_doigt0017.png", @"anim_titre_doigt0018.png",
                       @"anim_titre_doigt0019.png", @"anim_titre_doigt0020.png", @"anim_titre_doigt0021.png", @"anim_titre_doigt0022.png", @"anim_titre_doigt0023.png", @"anim_titre_doigt0024.png",
                       @"anim_titre_doigt0025.png", @"anim_titre_doigt0026.png", @"anim_titre_doigt0027.png", @"anim_titre_doigt0028.png", @"anim_titre_doigt0029.png", @"anim_titre_doigt0030.png",
                       @"anim_titre_doigt0031.png", @"anim_titre_doigt0032.png", @"anim_titre_doigt0033.png", @"anim_titre_doigt0034.png", @"anim_titre_doigt0035.png", @"anim_titre_doigt0036.png",
                       @"anim_titre_doigt0037.png", @"anim_titre_doigt0038.png", @"anim_titre_doigt0039.png", @"anim_titre_doigt0040.png", @"anim_titre_doigt0041.png", @"anim_titre_doigt0042.png",
                       @"anim_titre_doigt0043.png", @"anim_titre_doigt0044.png", @"anim_titre_doigt0045.png", @"anim_titre_doigt0046.png", @"anim_titre_doigt0047.png", @"anim_titre_doigt0048.png",
                       @"anim_titre_doigt0049.png", @"anim_titre_doigt0050.png", @"anim_titre_doigt0051.png", @"anim_titre_doigt0052.png", @"anim_titre_doigt0053.png", @"anim_titre_doigt0054.png",
                       @"anim_titre_doigt0055.png", @"anim_titre_doigt0056.png", @"anim_titre_doigt0057.png", @"anim_titre_doigt0058.png", @"anim_titre_doigt0059.png", @"anim_titre_doigt0060.png",
                       @"anim_titre_doigt0061.png", @"anim_titre_doigt0062.png", @"anim_titre_doigt0063.png", @"anim_titre_doigt0064.png", @"anim_titre_doigt0065.png", @"anim_titre_doigt0066.png",
                       @"anim_titre_doigt0067.png", @"anim_titre_doigt0068.png", @"anim_titre_doigt0069.png", @"anim_titre_doigt0070.png", @"anim_titre_doigt0071.png", @"anim_titre_doigt0072.png",
                       @"anim_titre_doigt0073.png", @"anim_titre_doigt0074.png", @"anim_titre_doigt0075.png", @"anim_titre_doigt0076.png", @"anim_titre_doigt0077.png", @"anim_titre_doigt0078.png",
                       @"anim_titre_doigt0079.png", @"anim_titre_doigt0080.png", @"anim_titre_doigt0081.png", @"anim_titre_doigt0082.png", @"anim_titre_doigt0083.png", @"anim_titre_doigt0084.png",
                       @"anim_titre_doigt0085.png", @"anim_titre_doigt0086.png", @"anim_titre_doigt0087.png", @"anim_titre_doigt0088.png", @"anim_titre_doigt0089.png", @"anim_titre_doigt0090.png",
                       @"anim_titre_doigt0091.png", @"anim_titre_doigt0092.png", @"anim_titre_doigt0093.png", @"anim_titre_doigt0094.png", @"anim_titre_doigt0095.png", @"anim_titre_doigt0096.png",
                       @"anim_titre_doigt0097.png", @"anim_titre_doigt0098.png", @"anim_titre_doigt0099.png", @"anim_titre_doigt0100.png", @"anim_titre_doigt0101.png", @"anim_titre_doigt0102.png",
                       @"anim_titre_doigt0103.png", @"anim_titre_doigt0104.png", @"anim_titre_doigt0105.png", @"anim_titre_doigt0106.png", @"anim_titre_doigt0107.png", @"anim_titre_doigt0108.png",
                       @"anim_titre_doigt0109.png", @"anim_titre_doigt0110.png", @"anim_titre_doigt0111.png", @"anim_titre_doigt0112.png", @"anim_titre_doigt0113.png", @"anim_titre_doigt0114.png",
                       @"anim_titre_doigt0115.png", @"anim_titre_doigt0116.png", @"anim_titre_doigt0117.png", @"anim_titre_doigt0118.png", @"anim_titre_doigt0119.png", @"anim_titre_doigt0120.png",
                       @"anim_titre_doigt0121.png", @"anim_titre_doigt0122.png", @"anim_titre_doigt0123.png", @"anim_titre_doigt0124.png", @"anim_titre_doigt0125.png", @"anim_titre_doigt0126.png",
                       @"anim_titre_doigt0127.png", @"anim_titre_doigt0128.png", @"anim_titre_doigt0129.png", @"anim_titre_doigt0130.png", @"anim_titre_doigt0131.png", @"anim_titre_doigt0132.png",
                       @"anim_titre_doigt0133.png", @"anim_titre_doigt0134.png", @"anim_titre_doigt0135.png", @"anim_titre_doigt0136.png"];
    
    return (array);
}

-(NSArray *)getExpAnim
{
    NSArray *array = @[@"animempreinte0001.png", @"animempreinte0002.png", @"animempreinte0003.png", @"animempreinte0004.png", @"animempreinte0005.png", @"animempreinte0006.png",
                       @"animempreinte0007.png", @"animempreinte0008.png", @"animempreinte0009.png", @"animempreinte0010.png", @"animempreinte0011.png", @"animempreinte0012.png",
                       @"animempreinte0013.png", @"animempreinte0014.png", @"animempreinte0015.png", @"animempreinte0016.png", @"animempreinte0017.png", @"animempreinte0018.png",
                       @"animempreinte0019.png", @"animempreinte0020.png", @"animempreinte0021.png", @"animempreinte0022.png", @"animempreinte0023.png", @"animempreinte0024.png",
                       @"animempreinte0025.png", @"animempreinte0026.png", @"animempreinte0027.png", @"animempreinte0028.png", @"animempreinte0029.png", @"animempreinte0030.png",
                       @"animempreinte0031.png", @"animempreinte0032.png", @"animempreinte0033.png", @"animempreinte0034.png", @"animempreinte0035.png", @"animempreinte0036.png",
                       @"animempreinte0037.png", @"animempreinte0038.png", @"animempreinte0039.png", @"animempreinte0040.png", @"animempreinte0041.png", @"animempreinte0042.png",
                       @"animempreinte0043.png", @"animempreinte0044.png", @"animempreinte0045.png", @"animempreinte0046.png", @"animempreinte0047.png", @"animempreinte0048.png",
                       @"animempreinte0049.png", @"animempreinte0050.png", @"animempreinte0051.png", @"animempreinte0052.png", @"animempreinte0053.png", @"animempreinte0054.png",
                       @"animempreinte0055.png", @"animempreinte0056.png", @"animempreinte0057.png", @"animempreinte0058.png", @"animempreinte0059.png", @"animempreinte0060.png",
                       @"animempreinte0061.png", @"animempreinte0062.png", @"animempreinte0063.png", @"animempreinte0064.png", @"animempreinte0065.png", @"animempreinte0066.png",
                       @"animempreinte0067.png", @"animempreinte0068.png", @"animempreinte0069.png", @"animempreinte0070.png", @"animempreinte0071.png", @"animempreinte0072.png",
                       @"animempreinte0073.png", @"animempreinte0074.png", @"animempreinte0075.png", @"animempreinte0076.png", @"animempreinte0077.png", @"animempreinte0078.png",
                       @"animempreinte0079.png", @"animempreinte0080.png", @"animempreinte0081.png", @"animempreinte0082.png", @"animempreinte0083.png", @"animempreinte0084.png",
                       @"animempreinte0085.png", @"animempreinte0086.png", @"animempreinte0087.png", @"animempreinte0088.png", @"animempreinte0089.png", @"animempreinte0090.png",
                       @"animempreinte0091.png", @"animempreinte0092.png", @"animempreinte0093.png", @"animempreinte0094.png", @"animempreinte0095.png", @"animempreinte0096.png",
                       @"animempreinte0097.png", @"animempreinte0098.png", @"animempreinte0099.png", @"animempreinte0100.png", @"animempreinte0101.png", @"animempreinte0102.png",
                       @"animempreinte0103.png", @"animempreinte0104.png", @"animempreinte0105.png", @"animempreinte0106.png", @"animempreinte0107.png", @"animempreinte0108.png",
                       @"animempreinte0109.png", @"animempreinte0110.png", @"animempreinte0111.png", @"animempreinte0112.png", @"animempreinte0113.png", @"animempreinte0114.png",
                       @"animempreinte0115.png", @"animempreinte0116.png"];

    return (array);
}

-(NSArray *)getAnimUsure1
{
    NSArray *array = @[@"animusure10001.png", @"animusure10002.png", @"animusure10003.png", @"animusure10004.png", @"animusure10005.png", @"animusure10006.png",
                       @"animusure10007.png", @"animusure10008.png", @"animusure10009.png", @"animusure10010.png", @"animusure10011.png", @"animusure10012.png",
                       @"animusure10013.png", @"animusure10014.png", @"animusure10015.png", @"animusure10016.png", @"animusure10017.png", @"animusure10018.png",
                       @"animusure10019.png", @"animusure10020.png", @"animusure10021.png", @"animusure10022.png", @"animusure10023.png", @"animusure10024.png",
                       @"animusure10025.png", @"animusure10026.png", @"animusure10027.png", @"animusure10028.png", @"animusure10029.png", @"animusure10030.png",
                       @"animusure10031.png", @"animusure10032.png", @"animusure10033.png", @"animusure10034.png", @"animusure10035.png", @"animusure10036.png",
                       @"animusure10037.png", @"animusure10038.png", @"animusure10039.png", @"animusure10040.png", @"animusure10041.png", @"animusure10042.png",
                       @"animusure10043.png", @"animusure10044.png", @"animusure10045.png", @"animusure10046.png", @"animusure10047.png", @"animusure10048.png",
                       @"animusure10049.png", @"animusure10050.png", @"animusure10051.png", @"animusure10052.png", @"animusure10053.png", @"animusure10054.png",
                       @"animusure10055.png", @"animusure10056.png", @"animusure10057.png", @"animusure10058.png", @"animusure10059.png", @"animusure10060.png"];
    
    return (array);
}

-(NSArray *)getAnimUsure2
{
    NSArray *array = @[@"animusure20001.png", @"animusure20002.png", @"animusure20003.png", @"animusure20004.png", @"animusure20005.png", @"animusure20006.png",
                       @"animusure20007.png", @"animusure20008.png", @"animusure20009.png", @"animusure20010.png", @"animusure20011.png", @"animusure20012.png",
                       @"animusure20013.png", @"animusure20014.png", @"animusure20015.png", @"animusure20016.png", @"animusure20017.png", @"animusure20018.png",
                       @"animusure20019.png", @"animusure20020.png", @"animusure20021.png", @"animusure20022.png", @"animusure20023.png", @"animusure20024.png",
                       @"animusure20025.png", @"animusure20026.png", @"animusure20027.png", @"animusure20028.png", @"animusure20029.png", @"animusure20030.png",
                       @"animusure20031.png", @"animusure20032.png", @"animusure20033.png", @"animusure20034.png", @"animusure20035.png", @"animusure20036.png",
                       @"animusure20037.png", @"animusure20038.png", @"animusure20039.png", @"animusure20040.png", @"animusure20041.png", @"animusure20042.png",
                       @"animusure20043.png", @"animusure20044.png", @"animusure20045.png", @"animusure20046.png", @"animusure20047.png", @"animusure20048.png",
                       @"animusure20049.png", @"animusure20050.png", @"animusure20051.png", @"animusure20052.png", @"animusure20053.png", @"animusure20054.png",
                       @"animusure20055.png", @"animusure20056.png", @"animusure20057.png", @"animusure20058.png", @"animusure20059.png", @"animusure20060.png"];
    
    return (array);
}

-(IBAction)menu:(id)sender
{
    CS_MenuView *menuView = [[CS_MenuView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:menuView];
}

-(IBAction)exp:(id)sender
{
    NSArray *names = [self getExpAnim];
    
    animExp = [[NSMutableArray alloc] init];
    for (int i = 0; i < names.count; i++) {
        [animExp addObject:[UIImage imageWithContentsOfFile:ResourcePath([names objectAtIndex:i])]];
    }
    
    animEmpreinte.animationImages = animExp;
    animEmpreinte.animationDuration = 4;
    animEmpreinte.animationRepeatCount = 1;
    
    [self.view addSubview:animFinger];
    [animEmpreinte startAnimating];
    
    [expButton setImage:[UIImage imageNamed:@"en-cours-de-scan.png"] forState:UIControlStateNormal];
    [expButton setImage:[UIImage imageNamed:@"en-cours-de-scan.png"] forState:UIControlStateHighlighted];
    expButton.enabled = NO;
    isAnimated = YES;
}

-(IBAction)start:(id)sender
{
    expButton.enabled = YES;
    startButton.enabled = NO;
    [expButton setImage:[UIImage imageNamed:@"lancerlescan_1.png"] forState:UIControlStateNormal];
    [expButton setImage:[UIImage imageNamed:@"lancerlescan_2.png"] forState:UIControlStateHighlighted];
    animEmpreinte.image = nil;
    animEmpreinte.image = [UIImage imageNamed:@"animempreinte0001.png"];
    backgroundFinger.image = nil;
    backgroundFinger.image = [UIImage imageNamed:@"fond2_doigt.jpg"];
}

-(IBAction)ok:(id)sender
{
    titleAnim = nil;
    animExp = nil;
    animUsure1 = nil;
    animUsure2 = nil;
    animUsure3 = nil;
    titreFinger.animationImages = nil;
    imgUsure1.animationImages = nil;
    imgUsure2.animationImages = nil;
    imgUsure3.animationImages = nil;
    CS_FingerViewController *fifth = [self.storyboard instantiateViewControllerWithIdentifier:@"EarVCID"];
    [self presentViewController:fifth animated:YES completion:nil];
}

-(void)onTimer
{
    static BOOL stop = YES;
    
    if (![self.animEmpreinte isAnimating] && stop == YES && isAnimated == YES) {
        stop = NO;
        isAnimated = NO;
        animEmpreinte.alpha = 0;
        backgroundFinger.image = nil;
        backgroundFinger.image = [UIImage imageNamed:@"fond3_doigt.jpg"];
        expButton.enabled = NO;
        expButton.alpha = 0;
        traitUn.alpha = 0;
        traitDeux.alpha = 0;
        
        NSArray *usureNames = [self getAnimUsure1];
        
        animUsure1 = [[NSMutableArray alloc] init];
        for (int i = 0; i < usureNames.count; i++) {
            [animUsure1 addObject:[UIImage imageWithContentsOfFile:ResourcePath([usureNames objectAtIndex:i])]];
        }
        
        imgUsure1.animationImages = animUsure1;
        imgUsure1.animationDuration = 1.5;
        imgUsure1.animationRepeatCount = 1;
        
        imgUsure1.alpha = 1;
        [self.view addSubview:imgUsure1];
        [imgUsure1 startAnimating];
        
        imgUsure3.animationImages = animUsure1;
        imgUsure3.animationDuration = 1.5;
        imgUsure3.animationRepeatCount = 1;
        
        imgUsure3.alpha = 1;
        [self.view addSubview:imgUsure3];
        [imgUsure3 startAnimating];
        
        usureNames = [self getAnimUsure2];
        
        animUsure2 = [[NSMutableArray alloc] init];
        for (int i = 0; i < usureNames.count; i++) {
            [animUsure2 addObject:[UIImage imageWithContentsOfFile:ResourcePath([usureNames objectAtIndex:i])]];
        }
        
        imgUsure2.animationImages = animUsure2;
        imgUsure2.animationDuration = 1.5;
        imgUsure2.animationRepeatCount = 1;
        
        imgUsure2.alpha = 1;
        [self.view addSubview:imgUsure2];
        [imgUsure2 startAnimating];
    }
    if (![self.imgUsure1 isAnimating] && stop == NO) {
        textUsure1.alpha = 1;
        textUsure2.alpha = 1;
        textUsure3.alpha = 1;
        stop = YES;
        okButton.alpha = 1;
        okButton.enabled = YES;
        [okButton setImage:[UIImage imageNamed:@"boutonprochainsens_inactif.png"] forState:UIControlStateNormal];
        [okButton setImage:[UIImage imageNamed:@"boutonprochainsens_actif.png"] forState:UIControlStateHighlighted];
        resultImg.image = nil;
        resultImg.image = [UIImage imageNamed:@"resultat_erosion.png"];
    }
}

-(void)animTitle
{
    static int i = 1;
    
    if (i == 137)
        i = 1;
    animFinger.image = nil;
    animFinger.image = [UIImage imageNamed:[NSString stringWithFormat:@"anim_titre_doigt%04d.png", i]];
    ++i;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    expButton.enabled = NO;
    globalProgress = 4;
    
    [expButton setImage:[UIImage imageNamed:@"deposezvotreindex.png"] forState:UIControlStateNormal];
    [expButton setImage:[UIImage imageNamed:@"deposezvotreindex.png"] forState:UIControlStateHighlighted];
    
    NSArray *titreImgAnim = @[@"titre_construction_1.png", @"titre_construction_2.png"];
    
    titleAnim = [[NSMutableArray alloc] init];
    for (int i = 0; i < titreImgAnim.count; i++) {
        [titleAnim addObject:[UIImage imageWithContentsOfFile:ResourcePath([titreImgAnim objectAtIndex:i])]];
    }
    
    titreFinger.animationImages = titleAnim;
    titreFinger.animationDuration = 1;
    
    [self.view addSubview:titreFinger];
    [titreFinger startAnimating];
    
    [NSTimer scheduledTimerWithTimeInterval: 5.0/136.0 target:self selector:@selector(animTitle) userInfo:nil repeats:YES];
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
