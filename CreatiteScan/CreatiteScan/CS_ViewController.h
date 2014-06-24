//
//  CS_ViewController.h
//  CreatiteScan
//
//  Created by thomas on 21/05/2014.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CS_ViewController : UIViewController

@property(nonatomic,retain) IBOutlet UIImageView *backgroundImage;
@property(nonatomic,weak) IBOutlet UIImageView *logoImage;
@property(nonatomic,weak) IBOutlet UIImageView *textImage;
@property(nonatomic,weak) IBOutlet UIImageView *loadingLabel;

@property(nonatomic,weak) IBOutlet UIProgressView *loadingView;

@property(nonatomic, retain) IBOutlet UIImageView *sentimentBackground;

extern NSInteger globalProgress;
extern BOOL isOnMenu;

#define ResourcePath(path)[[NSBundle mainBundle] pathForResource:path ofType:nil]

//#define ImageWithPath(path)[UIImage imageWithContentsOfFile:path]

@end
