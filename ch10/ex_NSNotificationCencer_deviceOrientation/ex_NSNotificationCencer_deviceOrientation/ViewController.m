//
//  ViewController.m
//  ex_NSNotificationCencer_deviceOrientation
//
//  Created by tyamamo on 2014/04/30.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelA;
@property (weak, nonatomic) IBOutlet UILabel *labelB;
@property (weak, nonatomic) IBOutlet UILabel *labelC;
@property (weak, nonatomic) IBOutlet UILabel *labelD;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    [notification addObserver:self
                     selector:@selector(changeDeviceOrientation:)
                         name:UIDeviceOrientationDidChangeNotification
                       object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeDeviceOrientation:(id)sender
{
    UIDevice* device = [UIDevice currentDevice];
    
    switch (device.orientation) {
        case UIDeviceOrientationPortrait:
            [self rotateLabels:0];
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            [self rotateLabels:180];
            break;
        case UIDeviceOrientationLandscapeLeft:
            [self rotateLabels:90];
            break;
        case UIDeviceOrientationLandscapeRight:
            [self rotateLabels:-90];
            break;
        default:
            NSLog(@"%1d", device.orientation);
            break;
    }
}

- (void)rotateView:(UIView*)targetView degree:(float)deg
{
    targetView.transform = CGAffineTransformMakeRotation((deg * M_PI) / 180.0);
}
- (void)rotateLabels:(float)degree
{
    [self rotateView:_labelA degree:degree];
    [self rotateView:_labelB degree:degree];
    [self rotateView:_labelC degree:degree];
    [self rotateView:_labelD degree:degree];
}

@end
