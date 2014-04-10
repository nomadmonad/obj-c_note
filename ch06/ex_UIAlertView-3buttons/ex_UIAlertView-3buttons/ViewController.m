//
//  ViewController.m
//  ex_UIAlertView-3buttons
//
//  Created by tyamamo on 2014/04/10.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)tapButton:(id)sender;

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

- (IBAction)tapButton:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Choose One"
                                                    message:@"ご予約は？"
                                                   delegate:self
                                          cancelButtonTitle:@"キャンセル"
                                          otherButtonTitles:@"Course A", @"Course B", nil];
    [alert show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"Cancelled.");
    } else if (buttonIndex == 1) {
        NSLog(@"Course A Choosed.");
    } else if (buttonIndex == 2) {
        NSLog(@"Course B Choosed.");
    }
}
@end
