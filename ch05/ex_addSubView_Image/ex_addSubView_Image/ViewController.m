//
//  ViewController.m
//  ex_addSubView_Image
//
//  Created by tyamamo on 2014/04/07.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *imageData = [UIImage imageNamed:@"flower.png"];
    CGRect rect = CGRectMake(0, 0, 200, 200);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = imageData;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.center = self.view.center;
    
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
