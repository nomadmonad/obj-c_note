//
//  ViewController.m
//  ex_AddSubView_Label
//
//  Created by tyamamo on 2014/04/04.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *myLabel;
- (IBAction)removeAddLabel:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UILabel *weatherLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 30)];
    weatherLabel.text = @"今日もいい天気";
    weatherLabel.textAlignment = NSTextAlignmentCenter;
    weatherLabel.textColor = [UIColor whiteColor];
    weatherLabel.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:weatherLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)removeAddLabel:(id)sender {
    if ([_myLabel isDescendantOfView:self.view]) {
        [_myLabel removeFromSuperview];
    } else {
        [self.view addSubview:_myLabel];
    }
}
@end
