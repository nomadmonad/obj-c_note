//
//  MyFanShape.m
//  ex_UIBezierPath_closePath
//
//  Created by tyamamo on 2014/04/16.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "MyFanShape.h"

@implementation MyFanShape

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
    CGFloat cx = self.bounds.size.width / 2;
    CGFloat cy = self.bounds.size.height / 2;
    CGPoint center = CGPointMake(cx, cy);
    CGFloat radius = cx - 20;
    CGFloat startAngle = -(M_PI / 2);
    CGFloat endAngle = (M_PI * 4) / 5;
    BOOL clockWise = YES;
    
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockWise];
    
    [arcPath addLineToPoint:center];
    [arcPath closePath];
    
    arcPath.lineWidth = 10;
    arcPath.lineCapStyle = kCGLineCapRound;
    [arcPath stroke];
    
    [[UIColor cyanColor] setFill];
    [arcPath fill];
}


@end
