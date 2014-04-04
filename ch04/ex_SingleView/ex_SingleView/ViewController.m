//
//  ViewController.m
//  ex_SingleView
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
    
    NSString *name = [self fullName:@"西浜" lastname:@"波子"];
    NSLog(@"Full name is %@", name);
    
    [self countUp];
    [self countUp];
    [self countUp];
    NSLog(@"Counter is ... %d", _counter);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)fullName:(NSString *)sei lastname:(NSString *)mei
{
    NSString *sei_mei = [NSString stringWithFormat:@"%@ %@", sei, mei];
    return sei_mei;
}

- (void)countUp
{
    _counter++;
}

@end
