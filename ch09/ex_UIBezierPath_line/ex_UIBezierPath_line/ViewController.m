//
//  ViewController.m
//  ex_UIBezierPath_line
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "MyLine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect rect = CGRectMake(0, 0, 200, 200);
    MyLine *line = [[MyLine alloc] initWithFrame:rect];
    
    [self.view addSubview:line];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
