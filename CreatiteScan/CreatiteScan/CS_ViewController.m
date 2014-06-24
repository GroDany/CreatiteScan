//
//  CS_ViewController.m
//  CreatiteScan
//
//  Created by thomas on 21/05/2014.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "CS_ViewController.h"
#import "CS_SommaireViewController.h"

@interface CS_ViewController ()

@end

@implementation CS_ViewController

@synthesize loadingLabel;
@synthesize loadingView;
@synthesize sentimentBackground;

NSInteger globalProgress = 0;
BOOL isOnMenu = NO;

-(void)newView
{
    CS_SommaireViewController *second = [self.storyboard instantiateViewControllerWithIdentifier:@"sommaireViewID"];
    [self presentViewController:second animated:YES completion:nil];
}

-(void)onTick:(NSTimer *) newTimer
{
    static float    i = 0;
    static int      flag = 0;

    [loadingView setProgress:i animated:YES];
    i += 0.004;
    if (loadingView.progress == 1 && !flag)
    {
        [self newView];
        flag = 1;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [loadingView setProgress:0 animated:NO];

    NSTimer *newTimer = [NSTimer timerWithTimeInterval:(1.0/60) target:self selector:@selector(onTick:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:newTimer forMode:NSDefaultRunLoopMode];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
