//
//  ViewController.m
//  ex_IBAction1
//
//  Created by tyamamo on 2014/04/04.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)updateValue:(UISlider *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateValue:(UISlider *)sender {
    NSLog(@"%.1f %%", sender.value * 100);
}
@end
