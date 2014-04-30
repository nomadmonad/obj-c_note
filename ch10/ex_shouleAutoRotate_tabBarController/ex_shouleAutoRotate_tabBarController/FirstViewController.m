//
//  FirstViewController.m
//  ex_shouleAutoRotate_tabBarController
//
//  Created by tyamamo on 2014/04/30.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "FirstViewController.h"
#import "TabBarController.h"

@interface FirstViewController ()
@property (nonatomic, readonly, strong) TabBarController* myTabBarController;
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_myTabBarController = (TabBarController *)self.tabBarController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight
        || toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        [_myTabBarController showTabBar:NO];
    } else {
        [_myTabBarController showTabBar:YES];
    }
    
    if (toInterfaceOrientation == UIDeviceOrientationFaceUp
        || toInterfaceOrientation == UIDeviceOrientationFaceDown) {
        NSLog(@"Hit Here");
    }
}

@end
