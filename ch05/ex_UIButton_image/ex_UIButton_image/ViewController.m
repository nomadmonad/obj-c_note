//
//  ViewController.m
//  ex_UIButton_image
//
//  Created by tyamamo on 2014/04/07.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)hello:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 50, 100, 40);
    
    button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button setTitle:@"Hello" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    UILabel *label = button.titleLabel;
    label.shadowOffset = CGSizeMake(2, 2);
    
    UIImage *buttonImage = [UIImage imageNamed:@"roundbtn.png"];
    UIImage *resizableImage = [buttonImage resizableImageWithCapInsets:UIEdgeInsetsMake(20, 24, 20, 24)];
    [button setBackgroundImage:resizableImage forState:UIControlStateNormal];
    [button setShowsTouchWhenHighlighted:YES];
    
    [button addTarget:self action:@selector(hello:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hello:(UIButton *)sender
{
    NSLog(@"hello");
}
     
@end
