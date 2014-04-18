//
//  ViewController.m
//  ex_UIView_animateWithDuration_completion
//
//  Created by tyamamo on 2014/04/17.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tomboImage;

- (IBAction)tapView:(UITapGestureRecognizer *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tomboImage.center = [self randamPoint];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapView:(UITapGestureRecognizer *)sender {
    CGPoint tapPoint = [sender locationInView:self.view];
    CGFloat angle = atan2(tapPoint.y - _tomboImage.center.y,
                          tapPoint.x - _tomboImage.center.x);
    _tomboImage.transform = CGAffineTransformMakeRotation(angle);
    
    UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState
                            | UIViewAnimationOptionAllowUserInteraction
                            | UIViewAnimationOptionCurveEaseOut;
    
    [UIView animateWithDuration:1.0
                          delay:0.0 options:options
                     animations:^{
                         _tomboImage.center = tapPoint;
                     }
                     completion:^(BOOL finished) {
                         [self getOut:_tomboImage];
                     }];
    
}

- (void) getOut:(UIImageView *)view
{
    UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState
    | UIViewAnimationOptionAllowUserInteraction
    | UIViewAnimationOptionCurveEaseIn;
    
    [UIView animateWithDuration:0.5
                          delay:1.0
                        options:options
                     animations:^{
                         CGPoint newPoint = [self randamPoint];
                         CGFloat newAngle = atan2(newPoint.y - _tomboImage.center.y,
                                                  newPoint.x - _tomboImage.center.x);
                         _tomboImage.transform = CGAffineTransformMakeRotation(newAngle);
                         _tomboImage.center = newPoint;
                     }
                     completion:nil];
}

- (CGPoint)randamPoint
{
    int height = self.view.bounds.size.height + 100;
    int y = (arc4random() % height) - 50;
    
    int x;
    int isLeft = arc4random() % 2;
    if (isLeft) {
        x = -100.0;
    } else {
        x = self.view.bounds.size.width + 100.0;
    }
    
    CGPoint pt = CGPointMake(x, y);
    
    return pt;
}

@end
