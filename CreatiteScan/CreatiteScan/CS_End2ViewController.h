//
//  CS_End2ViewController.h
//  CreatiteScan
//
//  Created by thomas on 17/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CS_End2ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *endBackground;
@property (nonatomic, weak) IBOutlet UIImageView *rotateImg;

@property (nonatomic, weak) IBOutlet UIButton *analyse;
@property (nonatomic, weak) IBOutlet UIButton *end;
@property (nonatomic, weak) IBOutlet UIButton *menuButton;

@property (nonatomic, weak) IBOutlet UITextField *text1;
@property (nonatomic, weak) IBOutlet UITextField *text2;
@property (nonatomic, weak) IBOutlet UITextField *text3;
@property (nonatomic, weak) IBOutlet UITextField *text4;

@property(nonatomic,weak) IBOutlet UIProgressView *loadingView;

-(IBAction)analyse:(id)sender;
-(IBAction)menu:(id)sender;
-(IBAction)end:(id)sender;

@end
