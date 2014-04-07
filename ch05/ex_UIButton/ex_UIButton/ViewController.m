//
//  ViewController.m
//  ex_UIButton
//
//  Created by tyamamo on 2014/04/07.
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
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Hello" forState:UIControlStateNormal];
    [button setTitle:@"こんにちは" forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    button.frame = CGRectMake(50, 50, 100, 40);
    
    [button addTarget:self action:@selector(hello:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hello:(UIButton *)sender
{
    NSLog(@"hello");
}

@end
