//
//  ViewController.m
//  ex_AddSubView_Label
//
//  Created by tyamamo on 2014/04/04.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 30)];
    myLabel.text = @"今日もいい天気";
    myLabel.textAlignment = NSTextAlignmentCenter;
    myLabel.textColor = [UIColor whiteColor];
    myLabel.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:myLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
