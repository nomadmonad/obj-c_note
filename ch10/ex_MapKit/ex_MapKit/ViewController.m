//
//  ViewController.m
//  ex_MapKit
//
//  Created by tyamamo on 2014/05/01.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIColor* defaultColor;
    CGFloat defaultPitch;
    CLLocationDistance defaultAltitude;
}
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *trackingButton;
@property (weak, nonatomic) IBOutlet UIToolbar *mytoolBar;
- (IBAction)tapTrackingButton:(UIBarButtonItem *)sender;
- (IBAction)tapMapTypeSegment:(UISegmentedControl *)sender;
- (IBAction)tapSpotButton:(UIBarButtonItem *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_myMapView.delegate = self;
    _myMapView.showsUserLocation = YES;
    _myMapView.showsBuildings = NO;
    
    defaultAltitude = _myMapView.camera.altitude;
    defaultPitch = _myMapView.camera.pitch;
    
    defaultColor = self.view.window.tintColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapTrackingButton:(UIBarButtonItem *)sender {
    switch (_myMapView.userTrackingMode) {
        case MKUserTrackingModeNone:
            [_myMapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
            _trackingButton.image = [UIImage imageNamed:@"trackingFollow.png"];
            break;
        case MKUserTrackingModeFollow:
            [_myMapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
            _trackingButton.image = [UIImage imageNamed:@"trackingHeading.png"];
            break;
        case MKUserTrackingModeFollowWithHeading:
            [_myMapView setUserTrackingMode:MKUserTrackingModeNone animated:YES];
            _trackingButton.image = [UIImage imageNamed:@"trackingNone.png"];
            break;
        default:
            break;
    }
}

- (IBAction)tapMapTypeSegment:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            _myMapView.mapType = MKMapTypeStandard;
            _mytoolBar.alpha = 1.0;
            _myMapView.camera.altitude = defaultAltitude;
            _myMapView.camera.pitch = defaultPitch;
            _myMapView.showsBuildings = NO;
            self.view.window.tintColor = defaultColor;
            break;
        case 1:
            _myMapView.mapType = MKMapTypeSatellite;
            _mytoolBar.alpha = 0.8;
            _myMapView.camera.altitude = defaultAltitude;
            _myMapView.camera.pitch = defaultPitch;
            _myMapView.showsBuildings = NO;
            self.view.window.tintColor = [UIColor whiteColor];
            break;
        case 2:
            _myMapView.mapType = MKMapTypeHybrid;
            _mytoolBar.alpha = 0.8;
            _myMapView.camera.altitude = defaultAltitude;
            _myMapView.camera.pitch = defaultPitch;
            _myMapView.showsBuildings = NO;
            self.view.window.tintColor = [UIColor whiteColor];
        case 3:
            _myMapView.mapType = MKMapTypeStandard;
            _myMapView.camera.altitude = 200;
            _myMapView.camera.pitch = 70;
            _myMapView.showsBuildings = YES;
            self.view.window.tintColor = defaultColor;
        default:
            break;
    }
}

- (IBAction)tapSpotButton:(UIBarButtonItem *)sender {
    CLLocationDegrees latitude = 35.305267;
    CLLocationDegrees longitude = 139.482348;
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(latitude, longitude);
    
    MKCoordinateRegion theSpot = MKCoordinateRegionMakeWithDistance(center, 1000, 1000);
    [_myMapView setRegion:theSpot animated:YES];
}
- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated
{
    _trackingButton.image = [UIImage imageNamed:@"trackingNone.png"];
}
@end
