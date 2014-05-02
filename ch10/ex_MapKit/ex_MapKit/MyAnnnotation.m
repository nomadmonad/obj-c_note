//
//  MyAnnnotation.m
//  ex_MapKit
//
//  Created by tyamamo on 2014/05/02.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "MyAnnnotation.h"

@implementation MyAnnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)pinCoordinate title:(NSString *)pinTitle
{
    _coordinate = pinCoordinate;
    _title = pinTitle;
    return  self;
}
@end
