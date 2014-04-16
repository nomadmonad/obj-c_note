//
//  ViewController.m
//  ex_UIBezierPath_arcCenter
//
//  Created by tyamamo on 2014/04/16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "MyArc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CGRect clockWiseRect = CGRectMake(20, 20, 160, 160);
    MyArc *clockWiseArc = [[MyArc alloc] initWithFrame:clockWiseRect];
    [clockWiseArc setClockWise:YES];
    
    [self.view addSubview:clockWiseArc];
    
    CGRect reverseClockWiseRect = CGRectMake(20, 180, 160, 160);
    MyArc *reverseClockWiseArc = [[MyArc alloc] initWithFrame:reverseClockWiseRect];
    [reverseClockWiseArc setClockWise:NO];
    
    [self.view addSubview:reverseClockWiseArc];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
