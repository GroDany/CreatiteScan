//
//  CS_ObsViewController.m
//  CreatiteScan
//
//  Created by thomas on 11/06/2014.
//  Copyright (c) 2014 thomas. All rights reserved.
//

#import "CS_ObsViewController.h"
#import "CS_ViewController.h"
#import "CS_FingerViewController.h"
#import "CS_MenuView.h"

@interface CS_ObsViewController () {
    UIImagePickerController *imagePicker;
    UIImageView *img;
    UIView *overlayView;
}

@end

@implementation CS_ObsViewController

@synthesize backgroundImg;
@synthesize showImg;
@synthesize loadImg;
@synthesize eyePlace;
@synthesize animTitre;
@synthesize titreImage;
@synthesize textOne;
@synthesize textTwo;
@synthesize percentImg;
@synthesize valueImg;
@synthesize animEye;
@synthesize cibleImg;
@synthesize myButton;
@synthesize nextButton;
@synthesize loadingView;
@synthesize menu;
@synthesize scanImg;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)animTitle
{
    static int i = 1;
    
    if (i == 137)
        i = 1;
    animTitre.image = nil;
    animTitre.image = [UIImage imageNamed:[NSString stringWithFormat:@"anim_titre_oeil%04d.png", i]];
    ++i;
}

-(IBAction)menu:(id)sender
{
    CS_MenuView *menuView = [[CS_MenuView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:menuView];
}

-(IBAction)next:(id)sender
{
    imagePicker = nil;
    titreImage.animationImages = nil;
    scanImg.animationImages = nil;
    CS_FingerViewController *fourth = [self.storyboard instantiateViewControllerWithIdentifier:@"BrainVCID"];
    [self presentViewController:fourth animated:YES completion:nil];
}

-(void)animScan
{
    static int i = 1;
    
    if (i > 171)
        return ;
    animEye.image = nil;
    animEye.image = [UIImage imageNamed:[NSString stringWithFormat:@"anim_oeil%04d.png", i]];
    if (i == 171) {
        cibleImg.alpha = 0;
        nextButton.alpha = 1;
        nextButton.enabled = YES;
        [nextButton setImage:[UIImage imageNamed:@"boutonprochainsens_inactif.png"] forState:UIControlStateNormal];
        [nextButton setImage:[UIImage imageNamed:@"boutonprochainsens_actif.png"] forState:UIControlStateHighlighted];
        scanImg.alpha = 0;
        valueImg.alpha = 1;
        percentImg.alpha = 1;
        textOne.alpha = 1;
        textTwo.alpha = 1;
    }
    ++i;
}

-(void)startScan
{
    animEye.alpha = 1;
    scanImg.alpha = 1;
    NSArray *nameImgAnim = @[@"scaning1.png", @"scaning2.png", @"scaning3.png", @"scaning4.png"];
    
    NSMutableArray *imgAnim = [[NSMutableArray alloc] init];
    for (int i = 0; i < nameImgAnim.count; i++) {
        [imgAnim addObject:[UIImage imageNamed:[nameImgAnim objectAtIndex:i]]];
    }
    
    scanImg.animationImages = imgAnim;
    scanImg.animationDuration = 5;
    scanImg.animationRepeatCount = 1;
    
    [self.view addSubview:scanImg];
    [scanImg startAnimating];
    imgAnim = nil;
    
    [NSTimer scheduledTimerWithTimeInterval: 5.0/171.0 target:self selector:@selector(animScan) userInfo:nil repeats:YES];
}

-(void)doProgress
{
    static int i = -2;
    
    if (i == -2) {
        loadImg.alpha = 1;
        myButton.enabled = NO;
        myButton.alpha = 0;
        loadingView.center = CGPointMake(self.view.center.x, 786);
        loadingView.alpha = 1;
        i = 0;
    }
    if (i >= 0 && i <= 100) {
        loadingView.progress = (float)i / 100.0;
        ++i;
    }
    if (i >= 0 && i > 100) {
        showImg.image = nil;
        eyePlace.alpha = 0;
        eyePlace.image = nil;
        loadImg.alpha = 0;
        backgroundImg.image = [UIImage imageNamed:@"fond_oeil.jpg"];
        loadingView.alpha = 0;
        [self startScan];
        i = -1;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    globalProgress = 2;
    // Do any additional setup after loading the view.
    [myButton setImage:[UIImage imageNamed:@"boutonlancerappareil_inactif.png"] forState:UIControlStateNormal];
    [myButton setImage:[UIImage imageNamed:@"boutonlancerappareil_actif.png"] forState:UIControlStateHighlighted];
    
    NSArray *titreImgAnim = @[@"titre_observation.png", @"titre_observation2.png"];
    
    NSMutableArray *imgAnim = [[NSMutableArray alloc] init];
    for (int i = 0; i < titreImgAnim.count; i++) {
        [imgAnim addObject:[UIImage imageNamed:[titreImgAnim objectAtIndex:i]]];
    }
    
    titreImage.animationImages = imgAnim;
    titreImage.animationDuration = 1;
    
    [self.view addSubview:titreImage];
    [titreImage startAnimating];
    imgAnim = nil;
    
    [NSTimer scheduledTimerWithTimeInterval: 5.0/136.0 target:self selector:@selector(animTitle) userInfo:nil repeats:YES];
}

- (IBAction)buttonPress:(id)sender {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView *noCameraAlert = [[UIAlertView alloc] initWithTitle:@"No Camera" message:@"Unable to access the camera!" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [noCameraAlert show];
    } else {
        
        loadingView.progress = 0;
        
        imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = NO;
        imagePicker.showsCameraControls = NO;
        
        CGRect overlayRect = CGRectMake(0, 0, imagePicker.view.frame.size.width, imagePicker.view.frame.size.height);
        overlayView = [[UIView alloc] initWithFrame:overlayRect];
        
        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placement_oeil.png"]];
        img.center = overlayView.center;
        img.alpha = 1;
        
        [overlayView addSubview:img];
        
        UIImageView *textImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 374, 89)];
        textImg.image = [UIImage imageNamed:@"placezvotreoeil.png"];
        textImg.center = CGPointMake(overlayView.center.x, 245);
        
        [overlayView addSubview:textImg];

        UIButton *takePictureButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 254, 175)];
        takePictureButton.center = CGPointMake(overlayView.center.x, overlayView.frame.size.height - 87);
        [takePictureButton setImage:[UIImage imageNamed:@"bouton_appareilphoto.png"] forState:UIControlStateNormal];
        [takePictureButton addTarget:self action:@selector(takePictureButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [overlayView addSubview:takePictureButton];

        [imagePicker setCameraOverlayView:overlayView];
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

#pragma mark - UIButton Selectors

-(void)mySelect
{
    img.alpha = 0;
    [imagePicker takePicture];
}

- (void)takePictureButtonPressed:(id)sender {
    img.image = [UIImage imageNamed:@"imagesubliminale_liondor.jpg"];
    [overlayView addSubview:img];
    [self performSelector:@selector(mySelect) withObject:nil afterDelay:0.10];
}

//- (void)menuButtonPressed:(id)sender {
//    CS_MenuView *menuView = [[CS_MenuView alloc] initWithFrame:self.view.frame];
//    [imagePicker.view addSubview:menuView];
//}

#pragma mark - UIImagePickerController Delegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)editingInfo {
    
    // determine if the user selected or took a new photo
    UIImage *selectedImage;
    if ([editingInfo objectForKey:UIImagePickerControllerOriginalImage]) selectedImage = (UIImage *)[editingInfo objectForKey:UIImagePickerControllerOriginalImage];
    else if ([editingInfo objectForKey:UIImagePickerControllerEditedImage]) selectedImage = (UIImage *)[editingInfo objectForKey:UIImagePickerControllerEditedImage];
    
    showImg.image = selectedImage;
    UIImage * flippedImage = [UIImage imageWithCGImage:showImg.image.CGImage scale:showImg.image.scale orientation:UIImageOrientationLeftMirrored];
    showImg.image = nil;
    showImg.image = flippedImage;
    
    // dismiss the imagePicker
    eyePlace.alpha = 1;
    [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    [NSTimer scheduledTimerWithTimeInterval: 0.03 target:self selector:@selector(doProgress) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
