//
//  CS_SommaireViewController.h
//  CreatiteScan
//
//  Created by thomas on 27/05/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CS_SommaireViewController : UIViewController

@property(nonatomic, weak) IBOutlet UIImageView *sommaireBackground;
@property(nonatomic, weak) IBOutlet UIImageView *circleImage;
@property(nonatomic, weak) IBOutlet UIImageView *backImage;
@property(nonatomic, weak) IBOutlet UIImageView *experienceUn;
@property(nonatomic, weak) IBOutlet UIImageView *experienceDeux;
@property(nonatomic, weak) IBOutlet UIImageView *experienceTrois;
@property(nonatomic, weak) IBOutlet UIImageView *experienceQuatre;
@property(nonatomic, weak) IBOutlet UIImageView *experienceCinq;
@property(nonatomic, weak) IBOutlet UIImageView *animeFleche;

@property(nonatomic,weak) IBOutlet UIButton *startButton;

-(IBAction)test:(id)sender;

@end
