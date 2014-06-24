//
//  CS_EndViewController.m
//  CreatiteScan
//
//  Created by thomas on 17/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import "CS_EndViewController.h"
#import "CS_ViewController.h"
#import "CS_End2ViewController.h"
#import "CS_MenuView.h"

@interface CS_EndViewController () {
    NSMutableArray *images;
}

@end

@implementation CS_EndViewController

@synthesize endBackground;
@synthesize animFleche;
@synthesize cibleImg;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)fleche:(id)sender
{
    images = nil;
    animFleche.animationImages = nil;
    CS_End2ViewController *sixth = [self.storyboard instantiateViewControllerWithIdentifier:@"End2VCID"];
    [self presentViewController:sixth animated:YES completion:nil];
}

-(IBAction)menu:(id)sender
{
    CS_MenuView *menuView = [[CS_MenuView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:menuView];
}

-(IBAction)analyse:(id)sender
{
    endBackground.image = [UIImage imageNamed:@"screen_analyse_1.jpg"];
    _analyse.enabled = NO;
    _analyse.alpha = 0;
    
    _fleche.enabled = YES;
    animFleche.alpha = 1;
    cibleImg.alpha = 0;
    NSArray *animImgNames = @[@"animfleche0001.png", @"animfleche0015.png", @"animfleche0045.png"];
    
    images = [[NSMutableArray alloc] init];
    for (int i = 0; i < animImgNames.count; i++) {
        [images addObject:[UIImage imageWithContentsOfFile:ResourcePath([animImgNames objectAtIndex:i])]];
    }
    
    animFleche.animationImages = images;
    animFleche.animationDuration = 1.5;
    
    [self.view addSubview:animFleche];
    [animFleche startAnimating];
}

int i = 2;

-(void)animBack
{
    if (i > 6) {
        _analyse.enabled = YES;
        i = -1;
    }
    if (i < 0)
        return ;
    endBackground.image = nil;
    endBackground.image = [UIImage imageNamed:[NSString stringWithFormat:@"new_screen_resultats_%d.jpg", i]];
    ++i;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_analyse setImage:[UIImage imageNamed:@"bouton_analyser_inactif.png"] forState:UIControlStateNormal];
    [_analyse setImage:[UIImage imageNamed:@"bouton_analyser_actif.png"] forState:UIControlStateHighlighted];
    _analyse.enabled = NO;
    animFleche.alpha = 0;
    
    [NSTimer scheduledTimerWithTimeInterval: 3.0/6.0 target:self selector:@selector(animBack) userInfo:nil repeats:YES];
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
