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

- (double)catAgeToHumanAge:(double)catAge
{
    double humanAge;
    
    if (catAge < 1) {
        humanAge = 20 * catAge;
    } else if (catAge <= 5) {
        humanAge = catAge * 6 + 15;
    } else if (catAge <= 10) {
        humanAge = catAge * 5 + 20;
    } else if (catAge <= 15) {
        humanAge = catAge * 4 + 30;
    } else {
        humanAge = catAge * 3 + 45;
    }
    return humanAge;
}
@end
