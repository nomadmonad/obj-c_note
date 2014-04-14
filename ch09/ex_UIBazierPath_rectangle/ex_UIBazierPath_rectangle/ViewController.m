//
//  ViewController.m
//  ex_UIBazierPath_rectangle
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	CGRect theFrame = CGRectMake(50, 50, 200, 200);
    MyView *myView = [[MyView alloc] initWithFrame:theFrame];
    
    myView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:myView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
