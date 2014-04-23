//
//  ViewController.m
//  ex_UIInterpolatingUIEffect
//
//  Created by tyamamo on 2014/04/23.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *trees;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed: @"stars.png"]];
    
    [self ipMotionEffect:_trees[0] offset:10.0];
    [self ipMotionEffect:_trees[1] offset:50.0];
    [self ipMotionEffect:_trees[2] offset:50.0];
    [self ipMotionEffect:_trees[3] offset:90.0];
    [self ipMotionEffect:_trees[4] offset:90.0];
    [self ipMotionEffect:_trees[5] offset:90.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ipMotionEffect:(UIView *)theView offset:(CGFloat) offset
{
    UIInterpolatingMotionEffect *effectX =
        [[UIInterpolatingMotionEffect alloc]
         initWithKeyPath:@"center.x"
                    type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    UIInterpolatingMotionEffect *effectY =
        [[UIInterpolatingMotionEffect alloc]
         initWithKeyPath:@"center.y"
                    type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    effectX.maximumRelativeValue = @(offset);
    effectX.minimumRelativeValue = @(-offset);
    
    effectY.maximumRelativeValue = @(offset);
    effectY.minimumRelativeValue = @(-offset);
    
    [theView addMotionEffect:effectX];
    [theView addMotionEffect:effectY];
}

@end
