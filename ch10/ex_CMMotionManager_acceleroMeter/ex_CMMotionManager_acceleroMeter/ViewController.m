//
//  ViewController.m
//  ex_CMMotionManager_acceleroMeter
//
//  Created by tyamamo on 2014/04/30.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
{
    CMMotionManager* motionManager;
    double speedX;
    double speedY;
    
    double viewWidth;
    double viewHeight;
    double ballR;
    double haneK;
}
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ball;

- (void)startAnimation;
- (void)animation:(CMAccelerometerData*)data;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self startAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startAnimation
{
    speedX = 0;
    speedY = 0;
    viewWidth = self.view.bounds.size.width;
    viewHeight = self.view.bounds.size.height;
    ballR =_ball.bounds.size.height / 2;
    haneK = 0.6;
    
    motionManager = [[CMMotionManager alloc] init];
    motionManager.accelerometerUpdateInterval = 0.006;
    
    CMAccelerometerHandler handler = ^(CMAccelerometerData* data, NSError *error) {
        [self animation:data];
    };
    
    [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                        withHandler:handler];
}

- (void)animation:(CMAccelerometerData *)data
{
    double time = data.timestamp;
    double accX = data.acceleration.x;
    double accY = data.acceleration.y;
    
    speedX += accX;
    speedY += accY;
    
    double cX = _ball.center.x + speedX;
    double cY = _ball.center.y - speedY;
    
    if ((cX < ballR) && speedX < 0) {
        speedX = -haneK * speedX;
        cX = ballR;
    } else if ((cX > (viewWidth - ballR)) && (speedX > 0)){
        speedX = -haneK * speedX;
        cX = viewWidth - ballR;
    }
    
    if ((cY < ballR) && (speedY > 0)) {
        speedY = -haneK * speedY;
        cY = ballR;
    } else if ((cY > (viewHeight - ballR)) && (speedY < 0)) {
        speedY = -haneK * speedY;
        cY = viewHeight - ballR;
    }
    
    _ball.center = CGPointMake(cX, cY);
    
    _myLabel.text = [NSString stringWithFormat:@"%.2f", time];
}

@end
