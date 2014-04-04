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
- (IBAction)bkgTapped:(id)sender;
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
    double catAge = [_catField.text doubleValue];
    double humanAge = [self catAgeToHumanAge:catAge];
    _humanLabel.text = [NSString stringWithFormat:@"%.1f 歳", humanAge];
}

- (IBAction)bkgTapped:(id)sender {
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSMutableString *tmp = [_catField.text mutableCopy];
    [tmp replaceCharactersInRange:range withString:string];
    bool isAgeLimit = [tmp doubleValue] <= 100;
    bool isLengthLimit = [tmp length] <= 4
    
    return isAgeLimit && isLengthLimit;
}
@end
