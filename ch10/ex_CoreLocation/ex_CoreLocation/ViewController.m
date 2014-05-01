//
//  ViewController.m
//  ex_CoreLocation
//
//  Created by tyamamo on 2014/05/01.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *latitude;
@property (weak, nonatomic) IBOutlet UILabel *gratitude;
@property (weak, nonatomic) IBOutlet UILabel *height;
@property (weak, nonatomic) IBOutlet UILabel *declination;
@property (weak, nonatomic) IBOutlet UILabel *orientation;
@property (weak, nonatomic) IBOutlet UISwitch *magNorthSwitch;
- (IBAction)changedMagNorthSwitch:(UISwitch *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *connpass;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self startLocationServices];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changedMagNorthSwitch:(UISwitch *)sender {
    useNorrh = sender.on;
}

- (void)startLocationServices
{
    if(!locationManager) {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
    }
    
    if([CLLocationManager locationServicesEnabled]) {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = 3;
        [locationManager startUpdatingLocation];
    }
    
    if ([CLLocationManager headingAvailable]) {
        useNorrh = NO;
        _magNorthSwitch.on = NO;
        locationManager.headingOrientation = CLDeviceOrientationPortrait;
        locationManager.headingFilter = 1;
        [locationManager startUpdatingHeading];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation* locationData = [locations lastObject];
    _latitude.text = [NSString stringWithFormat:@"%.3f", locationData.coordinate.latitude];
    _gratitude.text = [NSString stringWithFormat:@"%.3f", locationData.coordinate.longitude];
    _height.text = [NSString stringWithFormat:@"%.3f", locationData.altitude];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    CLLocationDirection trueNorth = newHeading.trueHeading;
    CLLocationDirection magNorth = newHeading.magneticHeading;
    
    _declination.text = [NSString stringWithFormat:@"%.1f", trueNorth - magNorth];
    
    CLLocationDirection heading;
    if (useNorrh) {
        
        heading = magNorth;
    } else {
        heading = trueNorth;
    }
    
    _connpass.transform = CGAffineTransformMakeRotation(-heading * M_PI / 180);
    _orientation.text = [NSString stringWithFormat:@"%.1f", heading];
}
@end
