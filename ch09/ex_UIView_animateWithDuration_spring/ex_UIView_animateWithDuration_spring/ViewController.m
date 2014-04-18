//
//  ViewController.m
//  ex_UIView_animateWithDuration_spring
//
//  Created by tyamamo on 2014/04/18.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *myBox;
- (IBAction)tapView:(UITapGestureRecognizer *)sender;

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

- (IBAction)tapView:(UITapGestureRecognizer *)sender
{
    CGPoint tappedPoint = [sender locationInView:self.view];
    
    CGFloat r = (arc4random() % 100) / 100.0;
    CGFloat g = (arc4random() % 100) / 100.0;
    CGFloat b = (arc4random() % 100) / 100.0;
    UIColor *boxColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    
    CGFloat width = (arc4random() % 100) + 50;
    CGPoint origin = CGPointMake(tappedPoint.x - (width / 2), tappedPoint.y - (width / 2));
    CGRect destFrame = CGRectMake(origin.x, origin.y, width, width);
    
    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:0.2
          initialSpringVelocity:5.0
                        options:0
                     animations:^{
                         _myBox.frame = destFrame;
                         _myBox.backgroundColor = boxColor;
                     }
                     completion:nil];
}
@end
