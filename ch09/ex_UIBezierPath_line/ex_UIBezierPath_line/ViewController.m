//
//  ViewController.m
//  ex_UIBezierPath_line
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "MyLine.h"
#import "MyLine2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect rect = CGRectMake(0, 0, 200, 200);
    MyLine *line = [[MyLine alloc] initWithFrame:rect];
    
    CGRect rect2 = CGRectMake(0, 250, 250, 250);
    MyLine2 *line2 = [[MyLine2 alloc] initWithFrame:rect2];
    
    [self.view addSubview:line];
    [self.view addSubview:line2];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
