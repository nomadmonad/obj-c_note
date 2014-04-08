//
//  ViewController.m
//  ex_UITapGR-doubleTap
//
//  Created by tyamamo on 2014/04/08.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)doubleTapFlower:(UITapGestureRecognizer *)sender;

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

- (IBAction)doubleTapFlower:(UITapGestureRecognizer *)sender {
    UIImageView *flower = (UIImageView *)sender.view;
    if(CGAffineTransformIsIdentity(sender.view.transform)) {
        flower.transform = CGAffineTransformMakeScale(3.0, 3.0);
    } else {
        flower.transform = CGAffineTransformIdentity;
    }
}
@end
