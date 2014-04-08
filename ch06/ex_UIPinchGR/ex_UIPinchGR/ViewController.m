//
//  ViewController.m
//  ex_UIPinchGR
//
//  Created by tyamamo on 2014/04/08.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGFloat prevScale;
}
@property (strong, nonatomic) IBOutlet UIImageView *flower;
- (IBAction)pinch:(UIPinchGestureRecognizer *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    prevScale = 1.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pinch:(UIPinchGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        sender.scale = prevScale;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        _flower.transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
        NSLog(@"scale is: %f", sender.scale);
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        prevScale = sender.scale;
    }
    
}
@end
