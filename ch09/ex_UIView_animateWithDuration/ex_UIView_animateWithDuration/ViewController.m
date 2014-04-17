//
//  ViewController.m
//  ex_UIView_animateWithDuration
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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    CGFloat cx = self.view.center.x;
    CGFloat cy = self.view.center.y;
    
    UIViewAnimationOptions options =
        UIViewAnimationOptionCurveEaseInOut
        | UIViewAnimationOptionAutoreverse
        | UIViewAnimationOptionRepeat;
    
    [UIView animateWithDuration:1.0
                          delay:2.0
                        options:options
                     animations:^{
                        _heartImage.center = CGPointMake(cx, cy + 50);
                     }
                     completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
