//
//  ViewController.m
//  ex_UIBezierPath_closePath
//
//  Created by tyamamo on 2014/04/16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "MyFanShape.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CGRect rect = CGRectMake(self.view.center.x - 80,
                             self.view.center.y - 80,
                             160, 160);
    MyFanShape *fanShape = [[MyFanShape alloc] initWithFrame:rect];
    
    [self.view addSubview:fanShape];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
