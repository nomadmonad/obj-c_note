//
//  MyLine2.m
//  ex_UIBezierPath_line
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "MyLine2.h"

@implementation MyLine2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *drawPath = [UIBezierPath bezierPath];
    
    drawPath.lineWidth = 20;
    drawPath.lineCapStyle = kCGLineCapRound;
    drawPath.lineJoinStyle = kCGLineJoinMiter;
    
    [drawPath moveToPoint:CGPointMake(100, 50)];
    [drawPath addLineToPoint:CGPointMake(150, 100)];
    [drawPath addLineToPoint:CGPointMake(50, 150)];
    [drawPath addLineToPoint:CGPointMake(110, 200)];
    
    [drawPath stroke];
    
}


@end
