//
//  MyView.m
//  ex_UIBazierPath_rectangle
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect theRect = CGRectMake(20, 50, 100, 120);
    UIBezierPath *drawPath = [UIBezierPath bezierPathWithRect:theRect];
    [drawPath stroke];
}


@end
