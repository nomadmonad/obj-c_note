//
//  MyArc.m
//  ex_UIBezierPath_arcCenter
//
//  Created by tyamamo on 2014/04/16.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "MyArc.h"

@implementation MyArc

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        clockWise = YES;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGFloat cx = self.bounds.size.width / 2;
    CGFloat cy = self.bounds.size.height / 2;
    
    CGPoint center = CGPointMake(cx, cy);
    CGFloat radius = cx - 20;
    CGFloat startAngle = 0.0;
    CGFloat endAngle = (M_PI * 3) / 2;
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:center
                                                              radius:radius
                                                          startAngle:startAngle
                                                            endAngle:endAngle
                                                           clockwise:clockWise];
    bezierPath.lineWidth = 20;
    bezierPath.lineCapStyle = kCGLineCapRound;
    [bezierPath stroke];
}


- (void)setClockWise:(BOOL)direction
{
    clockWise = direction;
}


@end
