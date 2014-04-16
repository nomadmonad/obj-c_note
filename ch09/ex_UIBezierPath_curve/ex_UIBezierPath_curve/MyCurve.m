//
//  MyCurve.m
//  ex_UIBezierPath_curve
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "MyCurve.h"

@interface MyCurve()
- (UIBezierPath *)makeLinePath:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end

@implementation MyCurve

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGPoint a = CGPointMake(50, 20);
    CGPoint b = CGPointMake(150, 20);
    CGPoint c = CGPointMake(120, 120);
    
    CGPoint d = CGPointMake(50, 200);
    CGPoint e = CGPointMake(150, 200);
    CGPoint f = CGPointMake(150, 300);
    CGPoint g = CGPointMake(50, 300);
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath appendPath:[self makeLinePath:a endPoint:b]];
    [linePath appendPath:[self makeLinePath:b endPoint:c]];
    [linePath appendPath:[self makeLinePath:d endPoint:e]];
    [linePath appendPath:[self makeLinePath:f endPoint:g]];
    [[UIColor grayColor] setStroke];
    linePath.lineWidth = 1;
    [linePath stroke];
    
    UIBezierPath *curvePath1 = [UIBezierPath bezierPath];
    [curvePath1 moveToPoint:a];
    [curvePath1 addQuadCurveToPoint:c controlPoint:b];
    [[UIColor redColor] setStroke];
    curvePath1.lineWidth = 2;
    [curvePath1 stroke];
    
    UIBezierPath *curvePath2 = [UIBezierPath bezierPath];
    [curvePath2 moveToPoint:d];
    [curvePath2 addCurveToPoint:f controlPoint1:e controlPoint2:g];
    [[UIColor blueColor] setStroke];
    curvePath2.lineWidth = 2;
    [curvePath2 stroke];
}

- (UIBezierPath *)makeLinePath:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    return path;
}

@end
