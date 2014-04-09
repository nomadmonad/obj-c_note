//
//  ViewController.m
//  ex_addGestureRecognizer-singleTapDoubleTap
//
//  Created by tyamamo on 2014/04/09.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void) singleTap:(UITapGestureRecognizer *)gesture;
- (void) doubleTap:(UITapGestureRecognizer *)gesture;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    singleTapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:singleTapGesture];
    
    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTapGesture];
    
    [singleTapGesture requireGestureRecognizerToFail:doubleTapGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) singleTap:(UITapGestureRecognizer *)gesture
{
    self.view.backgroundColor = [UIColor blueColor];
}
- (void) doubleTap:(UITapGestureRecognizer *)gesture
{
    self.view.backgroundColor = [UIColor redColor];
}
@end
