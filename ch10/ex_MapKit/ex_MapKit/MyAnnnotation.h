//
//  MyAnnnotation.h
//  ex_MapKit
//
//  Created by tyamamo on 2014/05/02.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnnotation : NSObject <MKAnnotation>
@property (nonatomic)CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString* title;

- (id)initWithCoordinate:(CLLocationCoordinate2D)pinCoordinate title:(NSString *)pinTitle;
@end
