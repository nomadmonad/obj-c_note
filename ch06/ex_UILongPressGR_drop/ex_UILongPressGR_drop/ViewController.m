//
//  ViewController.m
//  ex_UILongPressGR_drop
//
//  Created by tyamamo on 2014/04/08.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *arrow;

- (IBAction)longPress:(UILongPressGestureRecognizer *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _arrow.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)longPress:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        _arrow.hidden = NO;
        CGPoint pt = [sender locationInView:self.view];
        CGFloat height = _arrow.bounds.size.height;
        _arrow.center = CGPointMake(pt.x, -50);
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             _arrow.center = CGPointMake(pt.x, pt.y - height / 2);
                         }
                         completion:nil];
    }
}
@end
