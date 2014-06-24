//
//  CS_MenuView.m
//  CreatiteScan
//
//  Created by thomas on 16/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import "CS_MenuView.h"
#import "CS_SommaireViewController.h"
#import "CS_ViewController.h"

@implementation CS_MenuView {
    UIImageView *test;
    UIImageView *credImg;
    UIButton *credEnd;
    UIButton *menu;
    UIButton *stop;
    UIButton *credits;
    UIButton *video;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.97];
        
        test = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"barres_menu.png"]];
        test.center = self.center;
        [self addSubview:test];
        
        menu = [[UIButton alloc] initWithFrame:CGRectMake(50, 75, 58, 56)];
        [menu setImage:[UIImage imageNamed:@"menu_creatite_quitter.png"] forState:UIControlStateNormal];
        [menu addTarget:self action:@selector(menu:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menu];
        
        stop = [[UIButton alloc] initWithFrame:CGRectMake(151, 371, 467, 75)];
        [stop setImage:[UIImage imageNamed:@"arreterlexperience.png"] forState:UIControlStateNormal];
        [stop addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:stop];
        
        credits = [[UIButton alloc] initWithFrame:CGRectMake(151, 474, 467, 75)];
        [credits setImage:[UIImage imageNamed:@"credits.png"] forState:UIControlStateNormal];
        [credits addTarget:self action:@selector(credits:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:credits];

        video = [[UIButton alloc] initWithFrame:CGRectMake(151, 577, 467, 75)];
        [video setImage:[UIImage imageNamed:@"voirlavideo.png"] forState:UIControlStateNormal];
        [video addTarget:self action:@selector(video:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:video];
    }
    return self;
}

-(IBAction)menu:(id)sender
{
    isOnMenu = NO;
    [self removeFromSuperview];
}

- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    
    return nil;
}

-(IBAction)stop:(id)sender
{
    UIViewController *vc = [self viewController];
    
    isOnMenu = NO;
    CS_SommaireViewController *fourth = [vc.storyboard instantiateViewControllerWithIdentifier:@"sommaireViewID"];
    [vc presentViewController:fourth animated:YES completion:nil];
}

-(IBAction)credits:(id)sender
{
    test.alpha = 0;
    stop.enabled = NO;
    stop.alpha = 0;
    credits.enabled = NO;
    credits.alpha = 0;
    video.enabled = NO;
    video.alpha = 0;
    credImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"texte_credits.png"]];
    credImg.center = CGPointMake(self.center.x, 450);
    [self addSubview:credImg];
    credEnd = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 139, 54)];
    credEnd.center = CGPointMake(self.center.x, 800);
    [credEnd setImage:[UIImage imageNamed:@"bouton_retour_inactif.png"] forState:UIControlStateNormal];
    [credEnd setImage:[UIImage imageNamed:@"bouton_retour_actif.png"] forState:UIControlStateHighlighted];
    [credEnd addTarget:self action:@selector(retourCred:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:credEnd];
}

-(IBAction)retourCred:(id)sender
{
    test.alpha = 1;
    stop.enabled = YES;
    stop.alpha = 1;
    credits.enabled = YES;
    credits.alpha = 1;
    video.enabled = YES;
    video.alpha = 1;
    credImg.alpha = 0;
    credEnd.enabled = NO;
    credEnd.alpha = 0;
}

-(IBAction)video:(id)sender
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
