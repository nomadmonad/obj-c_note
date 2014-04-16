//
//  ViewController.m
//  ex_UIBezierPath_roundedRect
//
//  Created by tyamamo on 2014/04/16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "MyRoundRect.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect theFrame = CGRectMake(0, 0, 150, 150);
    MyRoundRect *myRoundRect = [[MyRoundRect alloc] initWithFrame:theFrame];
    
    myRoundRect.center = CGPointMake(160, 160);
    [self.view addSubview:myRoundRect];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
