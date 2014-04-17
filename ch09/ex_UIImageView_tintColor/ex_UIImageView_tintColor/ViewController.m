//
//  ViewController.m
//  ex_UIImageView_tintColor
//
//  Created by tyamamo on 2014/04/17.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *tombo1;
@property (strong, nonatomic) IBOutlet UIImageView *tombo2;
@property (strong, nonatomic) IBOutlet UIImageView *tombo3;
@property (strong, nonatomic) IBOutlet UIImageView *frog;
@property (strong, nonatomic) IBOutlet UIImageView *flower;
@property (strong, nonatomic) IBOutlet UIImageView *car;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_tombo1.image = [_tombo1.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _tombo2.image = [_tombo2.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _tombo1.tintColor = [UIColor colorWithRed:0.000 green:0.8 blue:0.6 alpha:1.0];
    _tombo2.tintColor = [UIColor colorWithRed:0 green:0.3 blue:0.5 alpha:1.0];
    
    _tombo3.image = [_tombo3.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _frog.image = [_frog.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    _flower.image = [_flower.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _car.image = [_car.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _flower.tintColor = [UIColor blueColor];
    _car.tintColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
