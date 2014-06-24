//
//  CS_BrainViewController.h
//  CreatiteScan
//
//  Created by thomas on 14/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CS_BrainViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *backgroundOne;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundTwo;
@property (nonatomic, weak) IBOutlet UIImageView *pictoText;
@property (nonatomic, weak) IBOutlet UIImageView *imgTitre;
@property (nonatomic, weak) IBOutlet UIImageView *animTitre;
@property (nonatomic, weak) IBOutlet UIImageView *animLeft;
@property (nonatomic, weak) IBOutlet UIImageView *animRight;
@property (nonatomic, weak) IBOutlet UIImageView *unityImg1;
@property (nonatomic, weak) IBOutlet UIImageView *unityImg2;
@property (nonatomic, weak) IBOutlet UIImageView *valueImg1;
@property (nonatomic, weak) IBOutlet UIImageView *valueImg2;

@property (nonatomic, weak) IBOutlet UIButton *okButton;
@property (nonatomic, weak) IBOutlet UIButton *startButton;
@property (nonatomic, weak) IBOutlet UIButton *endButton;
@property (nonatomic, weak) IBOutlet UIButton *menuButton;

-(IBAction)ok:(id)sender;
-(IBAction)start:(id)sender;
-(IBAction)end:(id)sender;
-(IBAction)menu:(id)sender;

@end
