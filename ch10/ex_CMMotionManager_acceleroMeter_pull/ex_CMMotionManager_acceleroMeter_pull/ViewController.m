//
//  ViewController.m
//  ex_CMMotionManager_acceleroMeter_pull
//
//  Created by tyamamo on 2014/04/30.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
{
    CMMotionManager* motionManager;
}
@property (weak, nonatomic) IBOutlet UILabel *labelX;
@property (weak, nonatomic) IBOutlet UILabel *labelY;
@property (weak, nonatomic) IBOutlet UILabel *labelZ;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
- (IBAction)startStop:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
- (IBAction)update:(UIButton *)sender;

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

- (IBAction)startStop:(UISwitch *)sender {
    if (_mySwitch.on) {
        if (!motionManager) {
            motionManager = [[CMMotionManager alloc] init];
        }
        [motionManager startAccelerometerUpdates];
        _updateButton.hidden = NO;
    } else {
        [motionManager stopAccelerometerUpdates];
        _updateButton.hidden = YES;
    }
}
- (IBAction)update:(UIButton *)sender {
    CMAccelerometerData* data = motionManager.accelerometerData;
    double accX = data.acceleration.x;
    double accY = data.acceleration.y;
    double accZ = data.acceleration.z;
    
    _labelX.text = [NSString stringWithFormat:@"x = %.4f", accX];
    _labelY.text = [NSString stringWithFormat:@"y = %.4f", accY];
    _labelZ.text = [NSString stringWithFormat:@"z = %.4f", accZ];
}
@end
