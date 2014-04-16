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
	
    CGRect rect = CGRectMake(20, 20, 160, 160);
    
    MyArc *arc = [[MyArc alloc] initWithFrame:rect];
    
    [self.view addSubview:arc];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
