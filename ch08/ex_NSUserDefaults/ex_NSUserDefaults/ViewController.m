//
//  ViewController.m
//  ex_NSUserDefaults
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UISlider *mySlider;
@property (strong, nonatomic) IBOutlet UISwitch *mySwitch;
@property (strong, nonatomic) IBOutlet UILabel *sliderLabel;
@property (strong, nonatomic) IBOutlet UILabel *switchLabel;
- (IBAction)changeSlider:(UISlider *)sender;
- (IBAction)changeSwitch:(UISwitch *)sender;

- (void)saveDefault;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
    _mySlider.value = [myDefaults floatForKey:@"sliderValue"];
    _sliderLabel.text = [NSString stringWithFormat:@"%2f", _mySlider.value];
    _mySwitch.on = [myDefaults boolForKey:@"switchValue"];
    if (_mySwitch.on == YES) {
        _switchLabel.text = @"ON";
    } else {
        _switchLabel.text = @"OFF";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeSlider:(UISlider *)sender {
    _sliderLabel.text = [NSString stringWithFormat:@"%2f", sender.value];
    [self saveDefault];
}

- (IBAction)changeSwitch:(UISwitch *)sender {
    if (sender.on == YES) {
        _switchLabel.text = @"ON";
    } else {
        _switchLabel.text = @"OFF";
    }
    [self saveDefault];
}

- (void)saveDefault
{
    NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
    [myDefaults setFloat:_mySlider.value forKey:@"sliderValue"];
    [myDefaults setBool:_mySwitch.on forKey:@"switchValue"];
    [myDefaults synchronize];
}
@end
