//
//  ViewController.m
//  ex_UIView_animateWithDuration_transform
//
//  Created by tyamamo on 2014/04/17.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *heartImage;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut
                            | UIViewAnimationOptionAutoreverse
                            | UIViewAnimationOptionRepeat;
    
    [UIView animateWithDuration:0.8
                          delay:2.0
                        options:options
                     animations:^{
                         _heartImage.transform = CGAffineTransformMakeScale(2.0, 2.0);
                         _heartImage.transform = CGAffineTransformMakeRotation(M_PI / 4);
                     }
                     completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
