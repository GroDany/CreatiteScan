//
//  CS_SentimentsViewController.h
//  CreatiteScan
//
//  Created by thomas on 31/05/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CS_SentimentsViewController : UIViewController

@property(nonatomic, weak) IBOutlet UIImageView *sentimentBackground;
@property(nonatomic, weak) IBOutlet UIImageView *menuBackground;
@property(nonatomic, weak) IBOutlet UIImageView *picto;
@property(nonatomic, weak) IBOutlet UIImageView *titreImage;
@property(nonatomic, weak) IBOutlet UIImageView *titreAnim;
@property(nonatomic, weak) IBOutlet UIImageView *cardioImage;
@property(nonatomic, weak) IBOutlet UIImageView *cardioAnim;
@property(nonatomic, weak) IBOutlet UIImageView *imgPuls;
@property(nonatomic, weak) IBOutlet UIImageView *percentLabel;

@property(nonatomic, weak) IBOutlet UIButton *startButton;
@property(nonatomic, weak) IBOutlet UIButton *menuButton;
@property(nonatomic, weak) IBOutlet UIButton *nextButton;

-(IBAction)start:(id)sender;
-(IBAction)menu:(id)sender;
-(IBAction)next:(id)sender;

@end
