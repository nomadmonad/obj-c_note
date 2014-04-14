//
//  ViewController.m
//  ex_UIBezierPath_circle
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "MyCircle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	CGRect rect1 = CGRectMake(0, 0, 200, 200);
    CGRect rect2 = CGRectMake(0, 0, 120, 60);
    
    MyCircle *circle1 = [[MyCircle alloc] initWithFrame:rect1];
    MyCircle *circle2 = [[MyCircle alloc] initWithFrame:rect2];
    
    circle1.center = CGPointMake(150, 150);
    circle2.center = CGPointMake(200, 200);
    
    [self.view addSubview:circle1];
    [self.view addSubview:circle2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
