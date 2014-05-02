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
}
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *trackingButton;
@property (weak, nonatomic) IBOutlet UIToolbar *mytoolBar;
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
- (IBAction)tapTrackingButton:(UIBarButtonItem *)sender;
- (IBAction)tapMapTypeSegment:(UISegmentedControl *)sender;
- (IBAction)tapSpotButton:(UIBarButtonItem *)sender;

- (void)moveTo:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_myMapView.delegate = self;
    _myMapView.showsUserLocation = YES;
    _myMapView.showsBuildings = NO;
    defaultColor = self.view.window.tintColor;
    
    _mySearchBar.delegate = self;
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
            _myMapView.camera.pitch = 0.0;
            _myMapView.showsBuildings = NO;
            self.view.window.tintColor = defaultColor;
            break;
        case 1:
            _myMapView.mapType = MKMapTypeSatellite;
            _mytoolBar.alpha = 0.8;
            _myMapView.camera.pitch = 0.0;
            _myMapView.showsBuildings = NO;
            self.view.window.tintColor = [UIColor whiteColor];
            break;
        case 2:
            _myMapView.mapType = MKMapTypeHybrid;
            _mytoolBar.alpha = 0.8;
            _myMapView.camera.pitch = 0.0;
            _myMapView.showsBuildings = NO;
            self.view.window.tintColor = [UIColor whiteColor];
            break;
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


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    CLGeocoder* geoCoder = [[CLGeocoder alloc] init];
    
    [geoCoder geocodeAddressString:searchBar.text
                          inRegion:nil
                 completionHandler:^(NSArray* placeMarks, NSError* error){
                     if (error) {
                         NSLog(@"error occurred: %@", error);
                     } else {
                         CLPlacemark* place = placeMarks[0];
                         CLLocationDegrees latitude = place.location.coordinate.latitude;
                         CLLocationDegrees longitude = place.location.coordinate.longitude;
                         [self moveTo:latitude longitude:longitude];
                     }
                 }];
}

- (void)moveTo:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude
{
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(latitude, longitude);
    MKCoordinateRegion theSpot = MKCoordinateRegionMakeWithDistance(center, 1000, 1000);
    [_myMapView setRegion:theSpot animated:YES];
}

@end
