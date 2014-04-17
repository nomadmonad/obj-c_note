//
//  ViewController.m
//  ex_UIImageView_animation
//
//  Created by tyamamo on 2014/04/17.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *animationSeq;
}
@property (strong, nonatomic) IBOutlet UIImageView *frogImage;
- (IBAction)tapFrog:(UITapGestureRecognizer *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	animationSeq = @[[UIImage imageNamed:@"frog1.png"],
                     [UIImage imageNamed:@"frog2.png"],
                     [UIImage imageNamed:@"frog3.png"],
                     [UIImage imageNamed:@"frog4.png"]];
    _frogImage.animationImages = animationSeq;
    
    _frogImage.animationDuration = 0.5;
    _frogImage.animationRepeatCount = 2;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapFrog:(UITapGestureRecognizer *)sender {
    if ([_frogImage isAnimating]) {
        [_frogImage stopAnimating];
    } else {
        [_frogImage startAnimating];
    }
}
@end
