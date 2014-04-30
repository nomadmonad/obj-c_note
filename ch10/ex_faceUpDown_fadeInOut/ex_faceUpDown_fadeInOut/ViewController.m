//
//  ViewController.m
//  ex_faceUpDown_fadeInOut
//
//  Created by tyamamo on 2014/04/30.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIImageView *tombo;

- (void) changeDeviceOrientation:(id)sender;
- (void) fadeInOut:(UIImageView *)imageView alpha:(float)alpnaV;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_tombo.alpha = 0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeDeviceOrientation:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void)changeDeviceOrientation:(id)sender
{
    switch ([[UIDevice currentDevice] orientation]) {
        case UIDeviceOrientationFaceUp:
            [self fadeInOut:_tombo alpha:0];
            [self fadeInOut:_bgImage alpha:1.0];
            break;
        case UIDeviceOrientationFaceDown:
            [self fadeInOut:_tombo alpha:1.0];
            [self fadeInOut:_bgImage alpha:0.2];
            break;
        default:
            break;
    }
}

- (void) fadeInOut:(UIImageView *)imageView alpha:(float)alpnaV
{
    
    UIViewAnimationOptions options =
        UIViewAnimationOptionBeginFromCurrentState
        | UIViewAnimationOptionAllowUserInteraction
        | UIViewAnimationOptionCurveEaseInOut;
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:options
                     animations:^{
                         imageView.alpha = alpnaV;
                     }
                     completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
