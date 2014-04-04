//
//  ViewController.m
//  CatAge_ver1
//
//  Created by tyamamo on 2014/04/04.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *catField;
@property (weak, nonatomic) IBOutlet UILabel *humanLabel;
- (IBAction)calc:(id)sender;
- (double)catAgeToHumanAge:(double)catAge;
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

- (IBAction)calc:(id)sender {
}

- (double)catAgeToHumanAge:(double)catAge
{
    return NAN;
}
@end
