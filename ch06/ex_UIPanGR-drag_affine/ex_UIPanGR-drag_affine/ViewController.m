//
//  ViewController.m
//  ex_UIPanGR-drag_affine
//
//  Created by tyamamo on 2014/04/08.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGPoint prevTranslation;
}
@property (strong, nonatomic) IBOutlet UIImageView *tombo;
- (IBAction)dragging:(UIPanGestureRecognizer *)sender;

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

- (IBAction)dragging:(UIPanGestureRecognizer *)sender {
    UIImageView *tombo = (UIImageView *)sender.view;
    CGPoint translation = [sender translationInView:self.view];
    if(sender.state == UIGestureRecognizerStateBegan) {
        [sender setTranslation:prevTranslation inView:self.view];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        tombo.transform = CGAffineTransformMakeTranslation(translation.x, translation.y);
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        prevTranslation = translation;
    }
}
@end
