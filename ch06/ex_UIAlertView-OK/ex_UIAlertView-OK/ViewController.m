//
//  ViewController.m
//  ex_UIAlertView-OK
//
//  Created by tyamamo on 2014/04/09.
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

- (IBAction)tapButton:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"確認"
                                                    message:@"実行する"
                                                   delegate:self
                                          cancelButtonTitle:@"キャンセル"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"cancelled.");
    } else if (buttonIndex == 1) {
        NSLog(@"confirmed.");
    }
}

@end
