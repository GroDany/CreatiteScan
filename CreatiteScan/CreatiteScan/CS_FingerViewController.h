//
//  CS_FingerViewController.h
//  CreatiteScan
//
//  Created by thomas on 11/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CS_FingerViewController : UIViewController

@property(nonatomic, weak) IBOutlet UIImageView *backgroundFinger;
@property(nonatomic, weak) IBOutlet UIImageView *titreFinger;
@property(nonatomic, weak) IBOutlet UIImageView *animFinger;
@property(nonatomic, weak) IBOutlet UIImageView *animEmpreinte;
@property(nonatomic, weak) IBOutlet UIImageView *imgUsure1;
@property(nonatomic, weak) IBOutlet UIImageView *imgUsure2;
@property(nonatomic, weak) IBOutlet UIImageView *imgUsure3;
@property(nonatomic, weak) IBOutlet UIImageView *textUsure1;
@property(nonatomic, weak) IBOutlet UIImageView *textUsure2;
@property(nonatomic, weak) IBOutlet UIImageView *textUsure3;
@property(nonatomic, weak) IBOutlet UIImageView *traitUn;
@property(nonatomic, weak) IBOutlet UIImageView *traitDeux;
@property(nonatomic, weak) IBOutlet UIImageView *resultImg;

@property(nonatomic, weak) IBOutlet UIButton *startButton;
@property(nonatomic, weak) IBOutlet UIButton *menuButton;
@property(nonatomic, weak) IBOutlet UIButton *expButton;
@property(nonatomic, weak) IBOutlet UIButton *okButton;

-(IBAction)menu:(id)sender;
-(IBAction)start:(id)sender;
-(IBAction)exp:(id)sender;
-(IBAction)ok:(id)sender;

@end
