//
//  CS_ObsViewController.h
//  CreatiteScan
//
//  Created by thomas on 11/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface CS_ObsViewController : UIViewController
<UIImagePickerControllerDelegate,
    UINavigationControllerDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *backgroundImg;
@property (nonatomic, weak) IBOutlet UIImageView *showImg;
@property (nonatomic, weak) IBOutlet UIImageView *eyePlace;
@property (nonatomic, weak) IBOutlet UIImageView *textOne;
@property (nonatomic, weak) IBOutlet UIImageView *textTwo;
@property (nonatomic, weak) IBOutlet UIImageView *percentImg;
@property (nonatomic, weak) IBOutlet UIImageView *valueImg;
@property (nonatomic, weak) IBOutlet UIImageView *animEye;
@property (nonatomic, weak) IBOutlet UIImageView *animTitre;
@property (nonatomic, weak) IBOutlet UIImageView *titreImage;
@property (nonatomic, weak) IBOutlet UIImageView *loadImg;
@property (nonatomic, weak) IBOutlet UIImageView *cibleImg;
@property (nonatomic, weak) IBOutlet UIImageView *scanImg;


@property (nonatomic, weak) IBOutlet UIButton *myButton;
@property (nonatomic, weak) IBOutlet UIButton *nextButton;
@property (nonatomic, weak) IBOutlet UIButton *menu;

@property (nonatomic,weak) IBOutlet UIProgressView *loadingView;

-(IBAction)buttonPress:(id)sender;
-(IBAction)next:(id)sender;
-(IBAction)menu:(id)sender;

@end
