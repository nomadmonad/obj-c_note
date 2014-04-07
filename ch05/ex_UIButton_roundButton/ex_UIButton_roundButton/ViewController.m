//
//  ViewController.m
//  ex_UIButton_roundButton
//
//  Created by tyamamo on 2014/04/07.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/CALayer.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 50, 100, 30);
    
    UIColor *bgColor = [UIColor colorWithRed:20/255.0 green:220/255.0 blue:128/255.0 alpha:1.0];
    button.backgroundColor = bgColor;
    [button.layer setCornerRadius:10.0];
    [button.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [button.layer setBorderWidth:1.0];
    
    button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button setTitle:@"hello" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [button setTitleShadowColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    button.titleLabel.shadowOffset = CGSizeMake(1, 1);
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
