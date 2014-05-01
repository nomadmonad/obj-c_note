//
//  ViewController.h
//  ex_CoreLocation
//
//  Created by tyamamo on 2014/05/01.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager* locationManager;
    BOOL useNorrh;
}

@end
