//
//  ViewController.m
//  ex_UIImageView_image
//
//  Created by tyamamo on 2014/04/07.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImage *imageData;
}
- (IBAction)switchChange:(UISwitch *)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageHolder;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    imageData = [UIImage imageNamed:@"surfshop.jpg"];
    _imageHolder.contentMode = UIViewContentModeScaleAspectFit;
    _imageHolder.backgroundColor = [UIColor lightGrayColor];
    _imageHolder.image = imageData;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchChange:(UISwitch *)sender {
    if (sender.on == YES) {
        _imageHolder.image = imageData;
    } else {
        _imageHolder.image = nil;
    }
}
@end
