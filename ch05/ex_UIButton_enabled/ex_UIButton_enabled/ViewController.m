//
//  ViewController.m
//  ex_UIButton_enabled
//
//  Created by tyamamo on 2014/04/07.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)accept:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"了解です" forState:UIControlStateNormal];
    [button setTitle:@"無効です" forState:UIControlStateDisabled];
    
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.frame = CGRectMake(50, 50, 100, 40);
    
    [button addTarget:self action:@selector(accept:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)accept:(UIButton *)sender
{
    NSLog(@"無効に変える");
    sender.enabled = NO;
    
}

@end
