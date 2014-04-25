//
//  ViewController.m
//  ex_UIDA_Snap
//
//  Created by tyamamo on 2014/04/25.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGFloat offsetRx, offsetRy;
    CGFloat offsetLx, offsetLy;
}
@property (weak, nonatomic) IBOutlet UIImageView* frogBody;
@property (weak, nonatomic) IBOutlet UIImageView* frogLeftEye;
@property (weak, nonatomic) IBOutlet UIImageView* frogRightEye;

@property (nonatomic, strong) UIDynamicAnimator* animator;
@property (nonatomic, strong) UISnapBehavior* bodySnapBehavior;
@property (nonatomic, strong) UISnapBehavior* rightEyeSnapBehavior;
@property (nonatomic, strong) UISnapBehavior* leftEyeSnapBehavior;

- (IBAction)tappedView:(UITapGestureRecognizer *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    offsetRx = _frogRightEye.center.x - _frogBody.center.x;
    offsetRy = _frogRightEye.center.y - _frogBody.center.y;
    offsetLx = _frogLeftEye.center.x - _frogBody.center.x;
    offsetLy = _frogLeftEye.center.x - _frogBody.center.y;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tappedView:(UITapGestureRecognizer *)sender {
    CGPoint tappedPoint = [sender locationInView:self.view];
    CGPoint eyeRPoint = CGPointMake(tappedPoint.x + offsetRx, tappedPoint.y + offsetRy);
    CGPoint eyeLPoint = CGPointMake(tappedPoint.x + offsetLx, tappedPoint.y + offsetLy);
    
    [_animator removeBehavior:_bodySnapBehavior];
    [_animator removeBehavior:_rightEyeSnapBehavior];
    [_animator removeBehavior:_leftEyeSnapBehavior];
    
    _bodySnapBehavior = [[UISnapBehavior alloc] initWithItem:_frogBody snapToPoint:tappedPoint];
    _rightEyeSnapBehavior = [[UISnapBehavior alloc] initWithItem:_frogRightEye snapToPoint:eyeRPoint];
    _leftEyeSnapBehavior = [[UISnapBehavior alloc] initWithItem:_frogLeftEye snapToPoint:eyeLPoint];
    
    [_animator addBehavior:_bodySnapBehavior];
    [_animator addBehavior:_rightEyeSnapBehavior];
    [_animator addBehavior:_leftEyeSnapBehavior];
}
@end
