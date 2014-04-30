//
//  FlipsideViewController.m
//  ex_shouldAutoRotate
//
//  Created by tyamamo on 2014/04/30.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()
{
    UIDevice* device;
    CGRect textViewFrame;
}
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@end

@implementation FlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    device = [UIDevice currentDevice];
    textViewFrame = CGRectMake(240, 85, 200, 200);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) shouldAutorotate
{
    switch (device.orientation) {
        case UIDeviceOrientationPortrait:
            return YES;
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            return NO;
            break;
        case UIDeviceOrientationLandscapeLeft:
            _myTextView.frame = textViewFrame;
            break;
        case UIDeviceOrientationLandscapeRight:
            _myTextView.frame = textViewFrame;
        default:
            return YES;
            break;
    }
    return YES;
}

- (NSUInteger) supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait
            | UIInterfaceOrientationMaskLandscapeRight
            | UIInterfaceOrientationMaskLandscapeLeft);
}

- (void) viewDidLayoutSubviews
{
    if (device.orientation == UIDeviceOrientationLandscapeRight
        || device.orientation == UIDeviceOrientationLandscapeLeft) {
        _myTextView.frame = textViewFrame;
    }
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
