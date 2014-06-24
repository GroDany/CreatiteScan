//
//  CS_EndViewController.h
//  CreatiteScan
//
//  Created by thomas on 17/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CS_EndViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *endBackground;
@property (nonatomic, weak) IBOutlet UIImageView *animFleche;
@property (nonatomic, weak) IBOutlet UIImageView *cibleImg;


@property (nonatomic, weak) IBOutlet UIButton *analyse;
@property (nonatomic, weak) IBOutlet UIButton *fleche;
@property (nonatomic, weak) IBOutlet UIButton *menuButton;

-(IBAction)analyse:(id)sender;
-(IBAction)fleche:(id)sender;
-(IBAction)menu:(id)sender;

@end
