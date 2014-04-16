//
//  ViewController.m
//  ex_UIBezierPath_curve
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "MyCurve.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect theFrame = CGRectMake(50, 50, 200, 320);
    MyCurve *line = [[MyCurve alloc] initWithFrame:theFrame];
    
    [self.view addSubview:line];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
