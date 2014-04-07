//
//  ViewController.m
//  ex_UIButton_ColorBGButton
//
//  Created by tyamamo on 2014/04/07.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "ColorBGButton.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ColorBGButton *button1 = [[ColorBGButton alloc] initWithFrame:CGRectMake(50, 50, 120, 30)
                                                           label:@"hello world!"
                                                         bgColor:RGBA(200, 200, 50, 1.0)];
    ColorBGButton *button2 = [[ColorBGButton alloc] initWithFrame:CGRectMake(50, 100, 100, 30)
                                                            label:@"いいね"
                                                          bgColor:RGBA(50, 100, 150, 1.0)];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
