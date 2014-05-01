//
//  ViewController.m
//  ex_CMMotionManager_deviceMotion
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
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ufo;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self startAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startAnimation
{
    motionManager = [[CMMotionManager alloc] init];
    
    if (!motionManager.deviceMotionAvailable) {
        return;
    }
    motionManager.deviceMotionUpdateInterval = 0.006;
    CMDeviceMotionHandler handler = ^(CMDeviceMotion* motion, NSError* error){
        [self animation:motion];
    };
    [motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue]
                                       withHandler:handler];
    
}

- (void)animation:(CMDeviceMotion*)motion
{
    double time = motion.timestamp;
    double roll = motion.attitude.roll;
    double pitch = motion.attitude.pitch;
    double yaw = motion.attitude.yaw;
    
    double width = self.view.bounds.size.width;
    double height = self.view.bounds.size.height;
    double cX = width * roll / M_PI;
    double cY = height * pitch /M_PI;
    
    CGAffineTransform tf1 = CGAffineTransformMakeRotation(yaw);
    CGAffineTransform tf2 = CGAffineTransformMakeTranslation(cX, cY);
    
    _ufo.transform = CGAffineTransformConcat(tf1, tf2);
    _myLabel.text = [NSString stringWithFormat:@"%.2f", time];
}
@end
