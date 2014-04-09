//
//  ViewController.m
//  ex_addGestureRecognizer
//
//  Created by tyamamo on 2014/04/09.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *heart;
}
- (void) tapHeart:(UIGestureRecognizer *)gesture;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"heart.png"];
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    CGRect rect = CGRectMake(0, 0, width, height);
    
    heart = [[UIImageView alloc] initWithFrame:rect];
    heart.image = image;
    heart.contentMode = UIViewContentModeScaleAspectFit;
    heart.center = CGPointMake(160, 150);
    heart.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHeart:)];
    [heart addGestureRecognizer:tapGesture];
    [self.view addSubview:heart];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapHeart:(UIGestureRecognizer *)gesture
{
    NSLog(@"heart tapped.");
    self.view.backgroundColor = [UIColor purpleColor];
}

@end
