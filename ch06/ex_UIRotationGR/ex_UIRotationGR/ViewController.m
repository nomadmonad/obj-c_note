//
//  ViewController.m
//  ex_UIRotationGR
//
//  Created by tyamamo on 2014/04/08.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGFloat prevRotation;
}
@property (strong, nonatomic) IBOutlet UIImageView *tombo;
- (IBAction)rotate:(UIRotationGestureRecognizer *)sender;

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

- (IBAction)rotate:(UIRotationGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        [sender setRotation:prevRotation];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        _tombo.transform = CGAffineTransformMakeRotation(sender.rotation);
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        prevRotation = sender.rotation;
    }

}
@end
